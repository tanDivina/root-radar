import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import '../generated/protocol.dart';

class DemoEndpoint extends Endpoint {
  @override
  bool get requireLogin => false;

  Future<void> seedPlants(Session session) async {
    print('DemoEndpoint.seedPlants starting...');
    final authInfo = session.authenticated;
    final userId = authInfo?.userId ?? 1;

    // 2. Insert Demo Plants at Finca Montezuma
    final centerLat = 9.22475;
    final centerLng = -82.25749;

    // Reset demo plants to ensure they appear at the correct locations
    try {
       await Plant.db.deleteWhere(session, where: (t) => t.userInfoId.equals(userId));
    } catch (e) {
       print('Error clearing old demo data: $e');
    }

    final demoPlants = [
      Plant(
        name: 'Theobroma Cacao',
        variety: 'Criollo',
        category: 'Fruit',
        plantedAt: DateTime.now().subtract(const Duration(days: 365)),
        daysToHarvest: 150,
        anchorId: 'demo_cacao',
        latitude: centerLat - 0.0001,
        longitude: centerLng - 0.0001,
        notes: 'Source of premium organic chocolate. Thrives in the humid volcanic soil of Finca Montezuma.',
        userInfoId: userId,
      ),
      Plant(
        name: 'Banana',
        variety: 'Gros Michel',
        category: 'Fruit',
        plantedAt: DateTime.now().subtract(const Duration(days: 120)),
        daysToHarvest: 90,
        anchorId: 'demo_banana',
        latitude: centerLat + 0.0001,
        longitude: centerLng + 0.0001,
        notes: 'Classic tropical variety. Fast growing in the rich bay-side soil of Isla San Cristobal.',
        userInfoId: userId,
      ),
      Plant(
        name: 'Coconut',
        variety: 'Golden Malay',
        category: 'Herb', // Changed from Tree to match existing categories in client if necessary, or kept as is
        plantedAt: DateTime.now().subtract(const Duration(days: 600)),
        daysToHarvest: 365,
        anchorId: 'demo_coconut',
        latitude: centerLat + 0.0001,
        longitude: centerLng - 0.0001,
        notes: 'Dwarf variety, easier to harvest. Located near the hilltop.',
        userInfoId: userId,
      ),
      Plant(
        name: 'Pineapple',
        variety: 'MD2',
        category: 'Fruit',
        plantedAt: DateTime.now().subtract(const Duration(days: 200)),
        daysToHarvest: 180,
        anchorId: 'demo_pineapple',
        latitude: centerLat - 0.0001,
        longitude: centerLng + 0.0001,
        notes: 'Sweet, low acidity hybrid. Planted in the well-drained slopes.',
        userInfoId: userId,
      ),

    ];

    try {
      for (var plant in demoPlants) {
        final p = await Plant.db.insertRow(session, plant);
        print('Successfully inserted ${plant.name}');
        
        // Add a flowering log for one plant to test prediction
        if (plant.name == 'Theobroma Cacao') {
           print('Logging flowering for Cacao...');
           await MaintenanceLog.db.insertRow(session, MaintenanceLog(
             plantId: p.id!,
             type: 'Flowering',
             timestamp: DateTime.now().subtract(const Duration(days: 150)), // ~5 months ago
             userInfoId: userId,
           ));
           print('Flowering log inserted.');
        }
      }

      // 3. Insert Demo Batches
      final demoBatches = [
        CacaoBatch(
          name: 'Batch #42 - Criollo',
          status: 'Fermenting',
          stage: 'Box 2',
          startedAt: DateTime.now().subtract(const Duration(days: 2)),
          lastStirredAt: DateTime.now().subtract(const Duration(hours: 36)), // Overdue!
          userInfoId: userId,
        ),
        CacaoBatch(
          name: 'Batch #41 - Trinitario',
          status: 'Drying',
          stage: 'Slide A',
          startedAt: DateTime.now().subtract(const Duration(days: 7)),
          lastStirredAt: DateTime.now().subtract(const Duration(hours: 4)),
          userInfoId: userId,
        ),
      ];

      for (var batch in demoBatches) {
        await CacaoBatch.db.insertRow(session, batch);
        print('Successfully inserted Batch ${batch.name}');
      }

      print('Demo data seeding complete');
    } catch (e) {
      print('Error inserting demo data: $e');
      rethrow;
    }
  }
}
