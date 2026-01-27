import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import '../generated/protocol.dart';

class DemoEndpoint extends Endpoint {
  @override
  bool get requireLogin => false;

  Future<void> seedPlants(Session session) async {
    print('DemoEndpoint.seedPlants called');
    // 1. Delete existing plants for user (Current User or Demo User 1)
    final authInfo = session.authenticated;
    final userId = authInfo?.userId ?? 1;
    print('Seeding demo plants for userId: $userId');
    
    try {
      await Plant.db.deleteWhere(
        session,
        where: (t) => t.userInfoId.equals(userId),
      );
      print('Deleted existing demo plants for user $userId');
    } catch (e) {
      print('Error deleting demo plants: $e');
    }

    // 2. Insert Demo Plants
    // Bocas del Toro coordinates
    final centerLat = 9.3418;
    final centerLng = -82.2408;

    final demoPlants = [
      Plant(
        name: 'Theobroma Cacao',
        variety: 'Criollo',
        category: 'Fruit',
        plantedAt: DateTime.now().subtract(const Duration(days: 365)),
        daysToHarvest: 150,
        anchorId: 'demo_cacao',
        latitude: centerLat - 0.001,
        longitude: centerLng - 0.001,
        notes: 'Tree to Truffle source. Needs shade.',
        userInfoId: userId,
      ),
      Plant(
        name: 'Banana',
        variety: 'Gros Michel',
        category: 'Fruit',
        plantedAt: DateTime.now().subtract(const Duration(days: 120)),
        daysToHarvest: 90,
        anchorId: 'demo_banana',
        latitude: centerLat + 0.001,
        longitude: centerLng + 0.001,
        notes: 'Fast growing. High potassium.',
        userInfoId: userId,
      ),
      Plant(
        name: 'Coconut',
        variety: 'Golden Malay',
        category: 'Tree',
        plantedAt: DateTime.now().subtract(const Duration(days: 600)),
        daysToHarvest: 365,
        anchorId: 'demo_coconut',
        latitude: centerLat + 0.001,
        longitude: centerLng - 0.001,
        notes: 'Dwarf variety, disease resistant.',
        userInfoId: userId,
      ),
      Plant(
        name: 'Pineapple',
        variety: 'MD2',
        category: 'Fruit',
        plantedAt: DateTime.now().subtract(const Duration(days: 200)),
        daysToHarvest: 180,
        anchorId: 'demo_pineapple',
        latitude: centerLat - 0.001,
        longitude: centerLng + 0.001,
        notes: 'Sweet, low acidity.',
        userInfoId: userId,
      ),
    ];

    try {
      for (var plant in demoPlants) {
        await Plant.db.insertRow(session, plant);
        print('Inserted ${plant.name}');
      }
      print('Demo data seeding complete');
    } catch (e) {
      print('Error inserting demo plants: $e');
      rethrow;
    }
  }
}
