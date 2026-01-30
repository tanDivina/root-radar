import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

// WeatherData is now defined in protocol

class WeatherService {
  Future<WeatherData> getForecast(Session session, double lat, double lon) async {
    final apiKey = session.serverpod.getPassword('weatherApiKey') ?? 'MOCK_API_KEY';

    if (apiKey == 'MOCK_API_KEY') {
      return WeatherData(
        temperature: 36.5,
        condition: 'Sunny',
        isHeatwave: true,
        humidity: 85, // High humidity for demo
        precipitationRisk: 0.1,
      );
    }

    try {
      final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric',
      ));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final temp = data['main']['temp'].toDouble();
        final condition = data['weather'][0]['main'];
        final humidity = data['main']['humidity'] as int?;
        // OpenWeatherMap free tier doesn't always have pop (probability of precipitation) in current weather, 
        // using rain.1h as a proxy or defaulting to 0.0
        final precipitation = data['rain'] != null ? 0.8 : 0.1; 

        return WeatherData(
          temperature: temp,
          condition: condition,
          isHeatwave: temp > 30,
          humidity: humidity,
          precipitationRisk: precipitation,
        );
      }
    } catch (e) {
      print('Error fetching weather: $e');
    }

    return WeatherData(
      temperature: 20.0,
      condition: 'Cloudy',
      isHeatwave: false,
    );
  }
}
