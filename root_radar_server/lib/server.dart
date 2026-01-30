import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:serverpod_auth_idp_server/providers/google.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/web/routes/app_config_route.dart';
import 'src/web/routes/root.dart';
import 'src/future_calls/morning_briefing_call.dart';
import 'src/services/mail_service.dart';
import 'src/web/routes/version_route.dart';
import 'src/web/routes/popup_friendly_flutter_route.dart';
import 'src/version.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints());

  final mailService = MailService();

  // Initialize authentication services for the server.
  // Token managers will be used to validate and issue authentication keys,
  // and the identity providers will be the authentication options available for users.
  pod.initializeAuthServices(
    tokenManagerBuilders: [
      // Use JWT for authentication keys towards the server.
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      /* 
      // DISABLED TO PREVENT CRASH ON CLOUD (Missing secrets)
      EmailIdpConfigFromPasswords(
        registrationVerificationCodeGenerator: () => '000000',
        passwordResetVerificationCodeGenerator: () => '000000',
        sendRegistrationVerificationCode: (session,
            {required email,
            required accountRequestId,
            required verificationCode,
            required transaction}) async {
          print('Registration code for $email: $verificationCode');
        },
        sendPasswordResetVerificationCode: (session,
            {required email,
            required passwordResetRequestId,
            required verificationCode,
            required transaction}) async {
          await mailService.sendPasswordResetCode(
              session, email, verificationCode);
        },
      ),
      GoogleIdpConfigFromPasswords(),
      */
    ],
  );

  // --- HIGH PRIORITY ROUTES ---
  pod.webServer.addRoute(VersionRoute(), '/version');
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/app/assets/config.json',
  );
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/app/assets/assets/config.json',
  );
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/config.json',
  );

  // Setup a default page at the web root.
  // These are used by the default page.
  pod.webServer.addRoute(RootRoute(), '/');
  pod.webServer.addRoute(RootRoute(), '/index.html');

  // Serve all files in the web/static relative directory under /.
  // These are used by the default web page.
  final root = Directory(Uri(path: 'web/static').toFilePath());
  pod.webServer.addRoute(StaticRoute.directory(root), '/static');

  // Serve the flutter web app under the /app path.
  // Using PopupFriendlyFlutterRoute instead of FlutterRoute to fix
  // Google Sign-In popup communication (COOP: same-origin-allow-popups).
  pod.webServer.addRoute(
    PopupFriendlyFlutterRoute(
      Directory(Uri(path: 'web/app').toFilePath()),
    ),
    '/app',
  );

  // DEBUG ROUTE - LIST FILES
  pod.webServer.addRoute(DebugRoute(), '/debug-fs');

  // Register FutureCalls
  pod.registerFutureCall(MorningBriefingCall(), 'morningBriefing');

  // Start the server.
  print('Running NEW server version v$serverVersion$serverVersionSuffix - PASSWORDS INCLUDED');
  await pod.start();

  // Trigger the first Morning Briefing 10 seconds after startup for testing
  pod.futureCallWithDelay('morningBriefing', null, const Duration(seconds: 10));
}

class DebugRoute extends Route {
  @override
  Future<Response> handleCall(Session session, Request request) async {
    final dir = Directory.current;
    final buffer = StringBuffer();
    buffer.writeln('Current Directory: ${dir.path}');
    try {
      await for (final entity in dir.list(recursive: true)) {
        buffer.writeln(entity.path);
      }
    } catch (e) {
      buffer.writeln('Error listing files: $e');
    }
    return Response.ok(
      body: Body.fromString(buffer.toString()),
      headers: Headers.fromMap({'content-type': ['text/plain']}),
    );
  }
}

