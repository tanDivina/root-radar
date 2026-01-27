import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import '../generated/protocol.dart';
import '../services/butler_service.dart';

class ButlerEndpoint extends Endpoint {
  @override
  bool get requireLogin => false; // Allow demo mode access

  Future<List<ButlerMessage>> getMessages(Session session) async {
    // If not logged in, use Demo User ID (1)
    final userId = session.authenticated?.userId ?? 1;

    session.log('Fetching messages for user $userId', level: LogLevel.info);

    return await ButlerMessage.db.find(
      session,
      where: (t) => t.userInfoId.equals(userId),
      orderBy: (t) => t.timestamp,
      orderDescending: true,
      limit: 50,
    );
  }

  Future<void> triggerBriefing(Session session) async {
    try {
      // If not logged in, use Demo User ID (1)
      final userId = session.authenticated?.userId ?? 1;
      
      session.log('Manually triggering Briefing for user $userId', level: LogLevel.info);

      // Use the Service directly for immediate, synchronous-like feedback for the USER.
      // This ensures they get a message RIGHT NOW without waiting involved in FutureCall.
      final butler = ButlerService();
      await butler.generateBriefingForUser(session, userId);
    } catch (e, stack) {
      session.log('Error triggering briefing: $e', level: LogLevel.error, stackTrace: stack);
      // Re-throw to let the caller know something went wrong, 
      // but now it's logged properly.
      rethrow;
    }
  }

  Future<void> chatWithButler(Session session, String message) async {
    try {
      final userId = session.authenticated?.userId ?? 1;
      session.log('User $userId sending message to Butler: $message', level: LogLevel.info);

      final butler = ButlerService();
      await butler.chatWithButler(session, userId, message);
    } catch (e, stack) {
      session.log('Error in chatWithButler: $e', level: LogLevel.error, stackTrace: stack);
      rethrow;
    }
  }
}
