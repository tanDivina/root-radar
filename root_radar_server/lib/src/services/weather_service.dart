import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherData {
  final double temperature;
  final String condition;
  final bool isHeatwave;

  WeatherData({
    required this.temperature,
    required this.condition,
    required this.isHeatwave,
  });
}

class WeatherService {
  // In a real app, you would get this from a secret or environment variable
  static const String _apiKey = 'MOCK_API_KEY';

  Future<WeatherData> getForecast(double lat, double lon) async {
    // Mocking the response for now to ensure the Butler works without a real API key
    // In a real implementation, we would use:
    // final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric'));
    
    // Simulating a heatwave for demonstration purposes
    return WeatherData(
      temperature: 36.5,
      condition: 'Sunny',
      isHeatwave: true,
    );
  }
}
