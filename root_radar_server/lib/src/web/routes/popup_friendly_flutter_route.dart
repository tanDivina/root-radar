import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:serverpod/serverpod.dart';
import '../middleware/popup_friendly_wasm_middleware.dart';

/// Custom Flutter route that uses popup-friendly COOP headers.
/// 
/// This is a modified version of Serverpod's FlutterRoute that uses
/// PopupFriendlyWasmMiddleware instead of WasmHeadersMiddleware.
/// This allows Google Sign-In popups to work properly.
class PopupFriendlyFlutterRoute extends Route {
  /// Files that should never be cached
  static const noCacheFiles = {
    'index.html',
    'flutter_service_worker.js',
    'flutter_bootstrap.js',
    'manifest.json',
    'version.json',
  };

  final Directory directory;
  final File indexFile;
  final CacheControlFactory cacheControlFactory;
  final CacheBustingConfig? cacheBustingConfig;

  PopupFriendlyFlutterRoute(
    this.directory, {
    File? indexFile,
    this.cacheControlFactory = _defaultFlutterCacheControl,
    this.cacheBustingConfig,
  }) : indexFile = indexFile ?? File(path.join(directory.path, 'index.html')),
       super(methods: {Method.get, Method.head});

  static CacheControlHeader? _defaultFlutterCacheControl(
    Request request,
    FileInfo fileInfo,
  ) {
    final filename = path.basename(fileInfo.file.path);
    if (noCacheFiles.contains(filename)) {
      return StaticRoute.privateNoCache()(request, fileInfo);
    }
    return StaticRoute.public(maxAge: const Duration(days: 1))(
      request,
      fileInfo,
    );
  }

  @override
  void injectIn(RelicRouter router) {
    final subRouter = Router<Handler>();

    // Use popup-friendly middleware instead of standard WASM headers
    subRouter.use('/', const PopupFriendlyWasmMiddleware().call);

    subRouter.use(
      '/',
      FallbackMiddleware(
        fallback: StaticRoute.file(
          indexFile,
          cacheControlFactory: StaticRoute.privateNoCache(),
        ),
        on: (response) => response.statusCode == 404,
      ).call,
    );

    StaticRoute.directory(
      directory,
      cacheBustingConfig: cacheBustingConfig,
      cacheControlFactory: cacheControlFactory,
    ).injectIn(subRouter);

    router.attach('/', subRouter);
  }

  @override
  FutureOr<Result> handleCall(Session session, Request request) {
    throw UnimplementedError(
      'PopupFriendlyFlutterRoute handles routing via injectIn',
    );
  }
}
