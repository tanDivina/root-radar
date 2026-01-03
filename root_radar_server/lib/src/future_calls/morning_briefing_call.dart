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
        session.log(
          'BUTLER MESSAGE [User ${plant.userInfoId}]: Sir, it is ${weather.temperature}°C and ${weather.condition} at the location of your "${plant.name}". '
          'I suggest extra water today.',
          level: LogLevel.info,
        );
      }

      // Growth Milestones
      final daysSincePlanted = DateTime.now().difference(plant.plantedAt).inDays;
      
      if (daysSincePlanted == 7) {
        session.log('BUTLER MESSAGE [User ${plant.userInfoId}]: Sir, your "${plant.name}" should be sprouting this week!', level: LogLevel.info);
      } else if (plant.daysToHarvest != null) {
        final daysLeft = plant.daysToHarvest! - daysSincePlanted;
        if (daysLeft == 0) {
          session.log('BUTLER MESSAGE [User ${plant.userInfoId}]: Excellent news, Sir! Your "${plant.name}" is ready for harvest.', level: LogLevel.info);
        } else if (daysLeft == 7) {
          session.log('BUTLER MESSAGE [User ${plant.userInfoId}]: Sir, the "${plant.name}" is entering its final week before harvest.', level: LogLevel.info);
        }
      }
    }

    // Reschedule for the next morning (24 hours later)
    session.serverpod.futureCallWithDelay('morningBriefing', null, const Duration(hours: 24));
  }
}
