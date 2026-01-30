import 'package:serverpod/serverpod.dart';

/// Middleware that adds WebAssembly headers with popup-friendly COOP policy.
/// 
/// This is a modified version of Serverpod's WasmHeadersMiddleware that sets
/// Cross-Origin-Opener-Policy to 'same-origin-allow-popups' instead of 'same-origin'.
/// This allows Google Sign-In popups to communicate back to the parent window.
/// 
/// Note: This preserves WASM multi-threading support while enabling popup-based
/// authentication flows like Google Sign-In.
class PopupFriendlyWasmMiddleware extends MiddlewareObject {
  const PopupFriendlyWasmMiddleware();

  @override
  Handler call(Handler next) {
    return (Request req) async {
      final result = await next(req);

      // Only modify Response objects
      if (result is Response) {
        return result.copyWith(
          headers: result.headers.transform((mh) {
            // Use same-origin-allow-popups instead of same-origin
            // This allows Google Sign-In popups to work while still
            // enabling WASM multi-threading
            mh.crossOriginOpenerPolicy =
                CrossOriginOpenerPolicyHeader.sameOriginAllowPopups;
            mh.crossOriginEmbedderPolicy =
                CrossOriginEmbedderPolicyHeader.requireCorp;
          }),
        );
      }

      return result;
    };
  }
}
