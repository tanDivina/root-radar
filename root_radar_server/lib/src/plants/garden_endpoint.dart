import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class GardenEndpoint extends Endpoint {
  @override
  bool get requireLogin => false;

  Future<void> savePlant(Session session, Plant plant) async {
    final authInfo = session.authenticated;
    // if (authInfo == null) return;
    final userId = authInfo?.userId ?? 1;

    plant.userInfoId = userId;
    await Plant.db.insertRow(session, plant);
  }

  Future<List<Plant>> getAllPlants(Session session) async {
    print('GardenEndpoint.getAllPlants called');
    final authInfo = session.authenticated;
    print('Auth info: $authInfo');
    // if (authInfo == null) return [];
    final userId = authInfo?.userId ?? 1;
    print('Using userId: $userId');

    return await Plant.db.find(
      session,
      where: (t) => t.userInfoId.equals(userId),
      orderBy: (t) => t.plantedAt,
    );
  }

  Future<void> deletePlant(Session session, int id) async {
    final authInfo = session.authenticated;
    // if (authInfo == null) return;
    final userId = authInfo?.userId ?? 1;

    await Plant.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id) & t.userInfoId.equals(userId),
    );
  }

  Future<String?> getUploadDescription(Session session, String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }
}
