import 'package:serverpod/serverpod.dart';
import '../../version.dart';

class VersionRoute extends Route {
  @override
  Future<bool> handleCall(Session session, Request request) async {
    request.httpRequest.response
      ..headers.contentType = ContentType.text
      ..write(fullServerVersion)
      ..close();
    return true;
  }
}
