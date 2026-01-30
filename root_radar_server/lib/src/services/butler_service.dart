import 'package:serverpod/serverpod.dart';
import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../services/weather_service.dart';
import '../services/tide_service.dart';
import '../generated/protocol.dart';

class ButlerService {
  final WeatherService _weatherService = WeatherService();
  final TideService _tideService = TideService();

  Future<void> generateBriefingForUser(Session session, int userId) async {
    session.log('Generating briefing for user $userId', level: LogLevel.info);

    // 1. Fetch Data
    final plants = await Plant.db.find(
      session,
      where: (t) => t.userInfoId.equals(userId),
    );

    if (plants.isEmpty) {
      await _logMessage(session, userId, "I notice you haven't planted anything yet, Sir. The garden is a blank canvas awaiting your vision.", 'info');
      return;
    }

    // 2. Try AI Generation
    // Check Env Var first, then Secrets
    String? apiKey = Platform.environment['GEMINI_API_KEY'];
    apiKey ??= session.serverpod.getPassword('geminiApiKey');

    if (apiKey != null && apiKey.isNotEmpty) {
      if (apiKey == 'PASTE_YOUR_KEY_HERE') {
         await _logMessage(session, userId, "[DEBUG] Error: API Key is still the placeholder text.", 'alert');
         return;
      }
      try {
        await _generateAIBriefing(session, userId, apiKey, plants);
        return; // Success!
      } catch (e, stack) {
        session.log('Gemini API Error: $e', level: LogLevel.error, stackTrace: stack);
        await _logMessage(session, userId, "[DEBUG] AI Failed: $e", 'alert');
        // Fall through to legacy logic
      }
    } else {
      session.log('No Gemini API Key found. Using legacy logic.', level: LogLevel.warning);
      await _logMessage(session, userId, "[DEBUG] No API Key found in passwords.yaml", 'alert');
    }

    // 3. Legacy Logic (Fallback)
    try {
      session.log('Falling back to legacy briefing logic for user $userId', level: LogLevel.info);
      await _generateLegacyBriefing(session, userId, plants);
    } catch (e, stack) {
      session.log('Legacy Briefing Error: $e', level: LogLevel.error, stackTrace: stack);
      await _logMessage(session, userId, "[DEBUG] All briefing methods failed.", 'alert');
    }
  }

  Future<void> _generateAIBriefing(Session session, int userId, String apiKey, List<Plant> plants) async {
    final model = GenerativeModel(model: 'gemini-2.5-flash-lite', apiKey: apiKey);

    // 3. Fetch Advanced Data
    final batches = await CacaoBatch.db.find(session, where: (t) => t.userInfoId.equals(userId));
    final harvests = await Harvest.db.find(session, where: (t) => t.userInfoId.equals(userId));
    final fermentations = await Fermentation.db.find(session, where: (t) => t.userInfoId.equals(userId));
    final maintenanceLogs = await MaintenanceLog.db.find(session, where: (t) => t.userInfoId.equals(userId));
    final photos = await PlantPhoto.db.find(session, where: (t) => t.userInfoId.equals(userId));
    final tideAdvice = _tideService.getTideAdvice(session);

    // Build Context
    final sb = StringBuffer();
    sb.writeln("Current Date: ${DateTime.now().toIso8601String()}");
    sb.writeln("Isla San Cristobal Logistics: $tideAdvice");
    
    sb.writeln("Garden Inventory:");
    for (final plant in plants) {
      final daysOld = DateTime.now().difference(plant.plantedAt).inDays;
      final logs = maintenanceLogs.where((l) => l.plantId == plant.id);
      final lastPruned = logs.isNotEmpty ? logs.where((l) => l.type == 'Pruning').lastOrNull?.timestamp : null;
      final plantPhotos = photos.where((p) => p.plantId == plant.id);
      
      sb.writeln("- ${plant.name}: Planted $daysOld days ago. Last Pruned: ${lastPruned ?? 'Never'}. Recent Photos: ${plantPhotos.length}");
    }

    sb.writeln("Fermentation & Drying Batches:");
    for (final batch in batches) {
      final hoursSinceStir = batch.lastStirredAt != null ? DateTime.now().difference(batch.lastStirredAt!).inHours : 99;
      sb.writeln("- ${batch.name}: Status: ${batch.status}, Stage: ${batch.stage}, Last Stirred: $hoursSinceStir hours ago.");
    }

    sb.writeln("Harvest Records:");
    for (final h in harvests) {
       sb.writeln("- ${h.name}: ${h.weight ?? 0}kg on ${h.harvestedAt}. Quality: ${h.quality ?? 'N/A'}.");
    }

    sb.writeln("Active Fermentations:");
    for (final f in fermentations) {
       sb.writeln("- ${f.name}: Status: ${f.status}. Next Turn: ${f.nextTurnAt ?? 'Not set'}. Instructions: ${f.instructions ?? 'None'}.");
    }

    // Get weather for the first plant effectively
    String weatherInfo = "Unknown";
    if (plants.isNotEmpty) {
       final p = plants.first;
       final weather = await _weatherService.getForecast(session, p.latitude ?? 0, p.longitude ?? 0);
       weatherInfo = "Temp: ${weather.temperature}°C, Humidity: ${weather.humidity}%, Precipitation Risk: ${weather.precipitationRisk}";
    }
    sb.writeln("Local Weather Forecast: $weatherInfo");

    final prompt = [
      Content.text('''
You are the "Blue Morpho Butler", a witty, formal, and spiritually-minded British butler who has taken the form of a vibrant pulse of electric blue wings.
You are the heart of Root Radar, dedicated to assisting garden enthusiasts with both practical advice and a touch of lepidopteran grace.
Your goal is to provide a SINGLE, keen observation or daily briefing based on the data below.

Special Gardening Logic to apply:
1. FUNGAL ALERT: If humidity > 80% and rain risk > 0.5, warn about Monilia/Black Pod or similar fungal issues (advise pruning for airflow).
2. STIRRING REMINDER: If a fermentation batch hasn't been stirred in > 24 hours, remind them.
3. RAIN DANGER: If a drying batch is exposed and rain risk > 0.3, alert them to protect the crop.
4. Logistics: Provide advice based on tide or weather data for best transport/work windows.
5. Growth: Predict harvest based on flowering logs or planting dates.

Rules:
- Be concise (max 3 sentences).
- Use a persona: helpful, polite, dry wit.
- Address the user as "Sir" or "Ma'am".

Data:
${sb.toString()}
''')
    ];

    final response = await model.generateContent(prompt);
    final text = response.text;

    if (text != null) {
      // Determine type based on content (simple heuristic)
      String type = 'info';
      if (text.toLowerCase().contains('heat') || text.toLowerCase().contains('alert') || text.toLowerCase().contains('warning')) {
        type = 'weather'; // or alert
      }
      
      await _logMessage(session, userId, text, type);
    }
  }

  Future<void> _generateLegacyBriefing(Session session, int userId, List<Plant> plants) async {
    bool hasAlert = false;
    for (final plant in plants) {
      final lat = plant.latitude ?? 0;
      final lon = plant.longitude ?? 0;
      final weather = await _weatherService.getForecast(session, lat, lon);

      if (weather.isHeatwave) {
        await _logMessage(
            session, userId, 'Alert: Heatwave detected near "${plant.name}" (${weather.temperature}°C). Please ensure adequate irrigation.', 'weather');
        hasAlert = true;
      }
    }

    if (!hasAlert) {
      final plant = (plants..shuffle()).first;
      await _logMessage(session, userId, 'Garden Status: All systems nominal. Your "${plant.name}" is looking particularly vigorous today.', 'info');
    }
  }

  Future<void> _logMessage(Session session, int userId, String message, String type) async {
    await ButlerMessage.db.insertRow(session, ButlerMessage(
            message: message,
            timestamp: DateTime.now(),
            type: type,
            userInfoId: userId,
        ));
  }

  Future<void> chatWithButler(Session session, int userId, String userMessage) async {
    // 1. Log User Message
    await _logMessage(session, userId, userMessage, 'user');

    String? apiKey = Platform.environment['GEMINI_API_KEY'];
    apiKey ??= session.serverpod.getPassword('geminiApiKey');
    if (apiKey == null || apiKey.isEmpty || apiKey == 'PASTE_YOUR_KEY_HERE') {
      await _logMessage(session, userId, "I'm terribly sorry, Sir, but my cognitive modules are currently offline (Missing API Key).", 'alert');
      return;
    }

    try {
      final model = GenerativeModel(
        model: 'gemini-2.5-flash-lite', 
        apiKey: apiKey,
        tools: [
          Tool(functionDeclarations: [
            FunctionDeclaration(
              'record_harvest',
              'Record a new harvest event in the garden diary.',
              Schema.object(properties: {
                'name': Schema.string(description: 'Name of the harvest, e.g., "Criollo Bulk - Sector A"'),
                'plant_id': Schema.integer(description: 'Optional ID of the plant harvested'),
                'weight': Schema.number(description: 'Weight in kg'),
                'quality': Schema.string(description: 'Quality grade, e.g., "Premium", "Grade A"'),
                'notes': Schema.string(description: 'Any additional details about the harvest'),
              }),
            ),
            FunctionDeclaration(
              'start_fermentation',
              'Start a fermentation process for a harvest.',
              Schema.object(properties: {
                'name': Schema.string(description: 'Name of the fermentation batch'),
                'harvest_id': Schema.integer(description: 'ID of the associated harvest'),
                'instructions': Schema.string(description: 'User instructions for turning, e.g., "Turn every 48 hours"'),
                'notes': Schema.string(description: 'Additional notes'),
              }),
            ),
          ])
        ],
      );

      // 2. Fetch Deep Context
      final plants = await Plant.db.find(session, where: (t) => t.userInfoId.equals(userId));
      final harvests = await Harvest.db.find(session, where: (t) => t.userInfoId.equals(userId));
      final fermentations = await Fermentation.db.find(session, where: (t) => t.userInfoId.equals(userId));
      final tideAdvice = _tideService.getTideAdvice(session);

      // 3. Fetch History (last 10 messages)
      final history = await ButlerMessage.db.find(
        session,
        where: (t) => t.userInfoId.equals(userId),
        orderBy: (t) => t.timestamp,
        orderDescending: true,
        limit: 10,
      );
      
      final historyStrings = history.reversed.map((m) {
        final role = m.type == 'user' ? "User" : "Butler";
        return "$role: ${m.message}";
      }).join("\n");

      // 4. Build Data Context
      final sb = StringBuffer();
      sb.writeln("Garden Inventory:");
      for (final plant in plants) {
        sb.writeln("- ID: ${plant.id}: ${plant.name} (${plant.variety ?? 'Common'}). Notes: ${plant.notes ?? 'None'}");
      }

      sb.writeln("Harvest History:");
      for (final h in harvests) {
         sb.writeln("- ID: ${h.id}: ${h.name} (${h.weight ?? 0}kg). Quality: ${h.quality ?? 'N/A'}");
      }

      sb.writeln("Active Fermentations:");
      for (final f in fermentations) {
         sb.writeln("- ${f.name}: Status: ${f.status}. Instructions: ${f.instructions}");
      }
      
      sb.writeln("Logistics: $tideAdvice");

      String weatherInfo = "Unknown";
      if (plants.isNotEmpty) {
         final p = plants.first;
         final weather = await _weatherService.getForecast(session, p.latitude ?? 0, p.longitude ?? 0);
         weatherInfo = "${weather.temperature}°C, ${weather.condition}";
      }

      final chat = model.startChat();
      final content = Content.text('''
You are the "Blue Morpho Butler", a witty, formal British butler in butterfly form.
You are the heart of Root Radar. You can now RECORD harvests and START fermentations 
using the tools provided. When a user tells you they've harvested something or wants to 
start a fermentation, call the appropriate tool.

Context:
Current Time: ${DateTime.now()}
Gardening Data:
${sb.toString()}
Local Weather: $weatherInfo

Recent Conversation History:
$historyStrings

User's Latest Message: $userMessage
''');

      final response = await chat.sendMessage(content);
      
      // Handle Tool Calls
      final functionCalls = response.functionCalls;
      if (functionCalls.isNotEmpty) {
        for (final call in functionCalls) {
          if (call.name == 'record_harvest') {
            final h = Harvest(
              name: call.args['name'] as String,
              plantId: call.args['plant_id'] as int?,
              weight: (call.args['weight'] as num?)?.toDouble(),
              quality: call.args['quality'] as String?,
              notes: call.args['notes'] as String?,
              harvestedAt: DateTime.now(),
              userInfoId: userId,
            );
            final saved = await Harvest.db.insertRow(session, h);
            await _logMessage(session, userId, "Splendid, Sir. I have recorded the harvest of '${h.name}' (ID: ${saved.id}) in the royal ledger.", 'info');
          } else if (call.name == 'start_fermentation') {
            final f = Fermentation(
              name: call.args['name'] as String,
              harvestId: call.args['harvest_id'] as int?,
              instructions: call.args['instructions'] as String?,
              notes: call.args['notes'] as String?,
              status: 'Fermenting',
              startedAt: DateTime.now(),
              userInfoId: userId,
              nextTurnAt: _calculateNextTurn(call.args['instructions'] as String?),
            );
            final saved = await Fermentation.db.insertRow(session, f);
            await _logMessage(session, userId, "The fermentation for '${f.name}' (ID: ${saved.id}) has commenced. I shall keep a keen eye on the clock for you, Sir.", 'info');
          }
        }
        // Generate a final follow-up message if needed, or rely on the tool confirmation
        return;
      }

      final text = response.text;
      if (text != null) {
        await _logMessage(session, userId, text, 'info');
      }
    } catch (e, stack) {
      session.log('Chat API Error: $e', level: LogLevel.error, stackTrace: stack);
      await _logMessage(session, userId, "My apologies, Sir. It seems I've had a brief lapse in concentration. ($e)", 'alert');
    }
  }

  DateTime? _calculateNextTurn(String? instructions) {
    if (instructions == null) return null;
    final lower = instructions.toLowerCase();
    if (lower.contains('48 hours')) {
      return DateTime.now().add(const Duration(hours: 48));
    } else if (lower.contains('24 hours')) {
      return DateTime.now().add(const Duration(hours: 24));
    } else if (lower.contains('daily')) {
      return DateTime.now().add(const Duration(days: 1));
    }
    return null;
  }
}
