import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class GardenEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> savePlant(Session session, Plant plant) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return;

    plant.userInfoId = authInfo.userId;
    await Plant.db.insertRow(session, plant);
  }

  Future<List<Plant>> getAllPlants(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return [];

    return await Plant.db.find(
      session,
      where: (t) => t.userInfoId.equals(authInfo.userId),
      orderBy: (t) => t.plantedAt,
    );
  }

  Future<void> deletePlant(Session session, int id) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return;

    await Plant.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id) & t.userInfoId.equals(authInfo.userId),
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
