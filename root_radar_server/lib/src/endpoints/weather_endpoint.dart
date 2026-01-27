import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/weather_service.dart';

class WeatherEndpoint extends Endpoint {
  @override
  bool get requireLogin => false;

  Future<WeatherData> getWeather(Session session, double lat, double lon) async {
    // We can reuse the service logic, but we need to map the internal WeatherData (if it exists) 
    // to the Protocol WeatherData.
    // Or simpler: Update WeatherService to return the Protocol WeatherData.
    // For now, I'll instantiate the service and map it manually to avoid circular dependencies if any,
    // or just assume WeatherService returns the right thing after I fix it.
    
    final service = WeatherService();
    // Assuming I will update WeatherService to return protocol.WeatherData
    return await service.getForecast(session, lat, lon);
  }
}
