import 'dart:io';
import 'package:serverpod/serverpod.dart';
import '../../version.dart';

class VersionRoute extends Route {
  @override
  Future<bool> handleCall(Session session, Request request) async {
    try {
      final response = request.response;
      response.contentType = ContentType.parse('text/plain; charset=utf-8');
      response.write(fullServerVersion);
      return true;
    } catch (e, stack) {
      session.log('Error in VersionRoute: $e', level: LogLevel.error, stackTrace: stack);
      return false; // Let Serverpod handle the error response
    }
  }
}
