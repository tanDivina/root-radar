import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'radar_screen.dart';
import 'plant_list_screen.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simple detection: AR is only supported on Android and iOS in this plugin.
    // In a production app, we would use a more robust check like:
    // await ArFlutterPlugin.getArCoreInstallStatus() or similar.
    
    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    if (isMobile) {
      return const RadarScreen();
    } else {
      return const PlantListScreen();
    }
  }
}
