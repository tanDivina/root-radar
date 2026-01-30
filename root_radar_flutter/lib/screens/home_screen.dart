import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'radar_screen.dart';
import 'plant_list_screen.dart';
import 'garden_map_screen.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'sign_in_screen.dart';
import 'butler_screen.dart';
import 'harvest_overview_screen.dart';
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
      const ButlerScreen(),
      // if (isMobile) const RadarScreen(),
    ];

    return SignInScreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Root Radar v7.1.0'),
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green.shade800,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/mascot.png',
                      height: 60,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Root Radar',
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Your Personal Garden Assistant',
                            style: TextStyle(color: Colors.white70, overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Blue Morpho Butler'),
                subtitle: const Text('Garden assistant and forecasts'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 2; // Butler index
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.assessment_outlined),
                title: const Text('Harvest Overview'),
                subtitle: const Text('Track your crop maturity'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HarvestOverviewScreen()),
                  );
                },
              ),
               ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign Out'),
                onTap: () async {
                  Navigator.pop(context);
                  await client.auth.signOutDevice();
                },
              ),
            ],
          ),
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
            /*
            if (isMobile)
              const BottomNavigationBarItem(
                icon: Icon(Icons.view_in_ar),
                label: 'Radar',
              ),
            */
            const BottomNavigationBarItem(
              icon: Icon(Icons.face), // Face icon for AI/Butler - More standard
              label: 'Blue Morpho',
            ),
          ],
        ),
      ),
    );
  }
}
