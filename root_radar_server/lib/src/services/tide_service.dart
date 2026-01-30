import 'package:serverpod/serverpod.dart';

class TideService {
  /// Returns a mock tide status/advice based on current hour
  String getTideAdvice(Session session) {
    final hour = DateTime.now().hour;
    // Simple 12-hour cycle mock
    final isHighTide = (hour >= 10 && hour <= 14) || (hour >= 22 || hour <= 2);
    
    if (isHighTide) {
      return "High tide approaching. Ideal for boat deliveries to the Finca Montezuma dock.";
    } else {
      return "Low tide. Access to the Dolphin Bay shore is restricted; avoid heavy boat shipments now.";
    }
  }
}
