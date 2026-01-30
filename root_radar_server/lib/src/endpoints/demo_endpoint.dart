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
    final centerLat = 9.22475; // Finca Montezuma
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
        
        // Add rich maintenance logs
        if (plant.name == 'Theobroma Cacao') {
           await MaintenanceLog.db.insertRow(session, MaintenanceLog(
             plantId: p.id!,
             type: 'Flowering',
             timestamp: DateTime.now().subtract(const Duration(days: 150)), 
             notes: 'First major flowering of the season. 80% canopy coverage.',
             userInfoId: userId,
           ));
           await MaintenanceLog.db.insertRow(session, MaintenanceLog(
             plantId: p.id!,
             type: 'Pruning',
             timestamp: DateTime.now().subtract(const Duration(days: 30)),
             notes: 'Maintenance pruning to improve airflow and reduce fungal risk.',
             userInfoId: userId,
           ));
        } else if (plant.name == 'Banana') {
           await MaintenanceLog.db.insertRow(session, MaintenanceLog(
             plantId: p.id!,
             type: 'Fertilizing',
             timestamp: DateTime.now().subtract(const Duration(days: 10)),
             notes: 'Applied organic potassium booster.',
             userInfoId: userId,
           ));
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
        final b = await CacaoBatch.db.insertRow(session, batch);
        print('Successfully inserted Batch ${batch.name}');

        // Add dummy fermentation log
        await Fermentation.db.insertRow(session, Fermentation(
          name: '${batch.name} - Initial Turn',
          status: 'Fermenting',
          userInfoId: userId,
          instructions: 'Turn daily for 6 days', 
          startedAt: DateTime.now().subtract(const Duration(days: 1)),
          nextTurnAt: DateTime.now().add(const Duration(hours: 12)),
          notes: 'Standard turn. Temperature 42°C. Smell is fruity/acidic.',
        ));
        
        if (batch.status == 'Drying') {
             await Fermentation.db.insertRow(session, Fermentation(
              name: '${batch.name} - Transfer to Drying',
              status: 'Drying',
              userInfoId: userId,
              instructions: 'Monitor rain risk', 
              startedAt: DateTime.now().subtract(const Duration(days: 3)),
              notes: 'Moved to solar dryer. Beans fully purple/brown.',
            ));
        }
      }

      print('Demo data seeding complete');
    } catch (e) {
      print('Error inserting demo data: $e');
      rethrow;
    }
  }
}
