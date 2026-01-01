import 'package:serverpod/serverpod.dart';
import '../services/weather_service.dart';
import '../generated/protocol.dart';

class MorningBriefingCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    session.log('Starting Morning Briefing...', level: LogLevel.info);

    final weatherService = WeatherService();
    
    // For this prototype, we'll assume a fixed location or iterate through users
    // In a full app, we would store the garden's location in the database
    final weather = await weatherService.getForecast(0, 0);

    if (weather.isHeatwave) {
      session.log('HEATWAVE DETECTED: Sending watering reminders.', level: LogLevel.info);
      
      // Get all plants that might be affected
      final plants = await Plant.db.find(session);
      
      for (final plant in plants) {
        // 1. Weather Reminder
        session.log(
          'BUTLER MESSAGE: Sir, it is ${weather.temperature}°C and ${weather.condition}. '
          'I suggest extra water for your "${plant.name}" today.',
          level: LogLevel.info,
        );

        // 2. Growth Milestones
        final daysSincePlanted = DateTime.now().difference(plant.plantedAt).inDays;
        
        if (daysSincePlanted == 7) {
          session.log('BUTLER MESSAGE: Sir, your "${plant.name}" should be sprouting this week! Keep an eye out for green shoots.', level: LogLevel.info);
        } else if (plant.daysToHarvest != null) {
          final daysLeft = plant.daysToHarvest! - daysSincePlanted;
          if (daysLeft == 0) {
            session.log('BUTLER MESSAGE: Excellent news, Sir! Your "${plant.name}" is officially ready for harvest today.', level: LogLevel.info);
          } else if (daysLeft == 7) {
            session.log('BUTLER MESSAGE: Sir, the "${plant.name}" is entering its final week before harvest. I shall prepare the baskets.', level: LogLevel.info);
          }
        }
      }
    }

    // Reschedule for the next morning (24 hours later)
    // In a real app, you might use a more sophisticated scheduling logic
    // session.serverpod.futureCallWithDelay('morningBriefing', null, Duration(hours: 24));
  }
}
