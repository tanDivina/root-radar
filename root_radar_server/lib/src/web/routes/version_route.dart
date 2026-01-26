import 'package:serverpod/serverpod.dart';
import '../../version.dart';

class VersionWidget extends TemplateWidget {
  VersionWidget() : super(name: 'version');
  
  @override
  String toString() => fullServerVersion;
}

class VersionRoute extends WidgetRoute {
  @override
  Future<TemplateWidget> build(Session session, Request request) async {
    return VersionWidget();
  }
}
