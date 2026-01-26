import 'package:serverpod/serverpod.dart';
import '../../version.dart';

class VersionWidget extends TemplateWidget {
  VersionWidget({required String version}) : super(name: 'version', values: {'fullServerVersion': version});
}

class VersionRoute extends WidgetRoute {
  @override
  Future<TemplateWidget> build(Session session, Request request) async {
    return VersionWidget(version: fullServerVersion);
  }
}
