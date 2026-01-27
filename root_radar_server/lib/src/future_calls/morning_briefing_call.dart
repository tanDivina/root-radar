import 'package:serverpod/serverpod.dart';
import '../services/weather_service.dart';
import '../generated/protocol.dart';

class MorningBriefingCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    session.log('Starting Morning Briefing...', level: LogLevel.info);

    final weatherService = WeatherService();
    
    // Get all plants
    final plants = await Plant.db.find(session);
    
    for (final plant in plants) {
      // Use plant's actual coordinates for hyper-local weather
      final lat = plant.latitude ?? 0;
      final lon = plant.longitude ?? 0;
      final weather = await weatherService.getForecast(session, lat, lon);

      if (weather.isHeatwave) {
        final msg = 'Sir, it is ${weather.temperature}°C and ${weather.condition} at the location of your "${plant.name}". I suggest extra water today.';
        session.log('BUTLER MESSAGE: $msg', level: LogLevel.info);
        await ButlerMessage.db.insertRow(session, ButlerMessage(
            message: msg,
            timestamp: DateTime.now(),
            type: 'weather',
            userInfoId: plant.userInfoId ?? 1,
        ));
      }

      // Growth Milestones
      final daysSincePlanted = DateTime.now().difference(plant.plantedAt).inDays;
      
      if (daysSincePlanted == 7) {
        final msg = 'Sir, your "${plant.name}" should be sprouting this week!';
        session.log('BUTLER MESSAGE: $msg', level: LogLevel.info);
         await ButlerMessage.db.insertRow(session, ButlerMessage(
            message: msg,
            timestamp: DateTime.now(),
            type: 'info',
            userInfoId: plant.userInfoId ?? 1,
        ));
      } else if (plant.daysToHarvest != null) {
        final daysLeft = plant.daysToHarvest! - daysSincePlanted;
        if (daysLeft == 0) {
          final msg = 'Excellent news, Sir! Your "${plant.name}" is ready for harvest.';
          session.log('BUTLER MESSAGE: $msg', level: LogLevel.info);
           await ButlerMessage.db.insertRow(session, ButlerMessage(
            message: msg,
            timestamp: DateTime.now(),
            type: 'alert',
            userInfoId: plant.userInfoId ?? 1,
        ));
        } else if (daysLeft == 7) {
          final msg = 'Sir, the "${plant.name}" is entering its final week before harvest.';
          session.log('BUTLER MESSAGE: $msg', level: LogLevel.info);
           await ButlerMessage.db.insertRow(session, ButlerMessage(
            message: msg,
            timestamp: DateTime.now(),
            type: 'info',
            userInfoId: plant.userInfoId ?? 1,
        ));
        }
      }
    }

    // Reschedule for the next morning (24 hours later)
    session.serverpod.futureCallWithDelay('morningBriefing', null, const Duration(hours: 24));
  }
}
