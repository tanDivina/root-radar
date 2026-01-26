import 'package:serverpod/serverpod.dart';
import '../../version.dart';

class VersionWidget extends TemplateWidget {
  VersionWidget({required String fullServerVersion}) : super(name: 'version', values: {'fullServerVersion': fullServerVersion});
}

class VersionRoute extends TemplateRoute {
  @override
  Future<Map<String, dynamic>> build(Session session, Request request) async {
    return {'fullServerVersion': fullServerVersion};
  }
}
