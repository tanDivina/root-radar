import 'package:root_radar_client/root_radar_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import 'config/app_config.dart';
import 'screens/greetings_screen.dart';
// import 'screens/radar_screen.dart';
import 'screens/home_screen.dart';

/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app. The client is generated from your server code
/// and is set up to connect to a Serverpod running on a local server on
/// the default port. You will need to modify this to connect to staging or
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice
/// instead of using a global client object. This is just a simple example.
late final Client client;

late String serverUrl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // IMMEDATE RESCUE UI - To prove the engine is alive despite possible async hangs
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Root Radar v6.0.0 - LATEST'),
            Text('Syncing with Garden Butler...'),
          ],
        ),
      ),
    ),
  ));

  try {
    const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
    final config = await AppConfig.loadConfig();
    var serverUrl = serverUrlFromEnv.isEmpty
        ? config.apiUrl ?? 'https://root-radar-v4.api.serverpod.space/'
        : serverUrlFromEnv;
    
    // Normalize URL and ensure we don't hit the old endpoint if we are on v4
    if (serverUrl.contains('root-radar.api.serverpod.space')) {
      print('Detected LEGACY URL in config, overriding to v4 API.');
      serverUrl = 'https://root-radar-v4.api.serverpod.space/';
    }
    
    if (!serverUrl.endsWith('/')) {
      serverUrl = '$serverUrl/';
    }

    client = Client(serverUrl)
      ..connectivityMonitor = FlutterConnectivityMonitor()
      ..authSessionManager = FlutterAuthSessionManager();

    await client.auth.initialize();
    
    runApp(const MyApp());
  } catch (e) {
    runApp(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('CRITICAL BOOT ERROR: $e'),
        ),
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Root Radar v6.0.0',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green.shade800,
          primary: Colors.green.shade800,
          secondary: Colors.teal.shade700,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          titleLarge: TextStyle(fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 14),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
