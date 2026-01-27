import 'package:root_radar_server/src/web/widgets/cache_buster_widget.dart';
import 'package:serverpod/serverpod.dart';

class RootRoute extends WidgetRoute {
  @override
  Future<TemplateWidget> build(Session session, Request request) async {
    return CacheBusterWidget();
  }
}
