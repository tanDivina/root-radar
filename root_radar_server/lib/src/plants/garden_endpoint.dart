import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GardenEndpoint extends Endpoint {
  Future<void> savePlant(Session session, Plant plant) async {
    await Plant.db.insertRow(session, plant);
  }

  Future<List<Plant>> getAllPlants(Session session) async {
    return await Plant.db.find(session, orderBy: (t) => t.plantedAt);
  }

  Future<void> deletePlant(Session session, int id) async {
    await Plant.db.deleteWhere(session, where: (t) => t.id.equals(id));
  }
}
