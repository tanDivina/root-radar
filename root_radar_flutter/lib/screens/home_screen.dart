import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'radar_screen.dart';
import 'plant_list_screen.dart';
import 'garden_map_screen.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'sign_in_screen.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isMobile = !kIsWeb && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS);

    final List<Widget> screens = [
      const PlantListScreen(),
      const GardenMapScreen(),
      if (isMobile) const RadarScreen(),
    ];

    return SignInScreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Root Radar'),
          backgroundColor: Colors.green.shade800,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await client.auth.signOutDevice();
              },
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: Colors.green.shade800,
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            if (isMobile)
              const BottomNavigationBarItem(
                icon: Icon(Icons.view_in_ar),
                label: 'Radar',
              ),
          ],
        ),
      ),
    );
  }
}
