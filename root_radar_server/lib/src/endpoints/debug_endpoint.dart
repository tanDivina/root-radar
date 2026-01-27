import 'package:serverpod/serverpod.dart';

class DebugEndpoint extends Endpoint {
  Future<void> triggerMorningBriefing(Session session) async {
    // Manually trigger the morning briefing immediately
    session.log('Manually triggering Morning Briefing via DebugEndpoint', level: LogLevel.info);
    await session.serverpod.futureCallWithDelay('morningBriefing', null, Duration.zero);
  }
}
