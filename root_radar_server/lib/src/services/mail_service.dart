import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

class MailService {
  /// Sends a registration verification code to the specified email.
  Future<bool> sendRegistrationCode(
    Session session,
    String email,
    String verificationCode,
  ) async {
    return _sendEmail(
      session,
      email,
      'Welcome to Root Radar!',
      'Your verification code is: $verificationCode',
      '<html><body><h1>Welcome to Root Radar!</h1><p>Your verification code is: <strong>$verificationCode</strong></p></body></html>',
    );
  }

  /// Sends a password reset verification code to the specified email.
  Future<bool> sendPasswordResetCode(
    Session session,
    String email,
    String verificationCode,
  ) async {
    return _sendEmail(
      session,
      email,
      'Password Reset for Root Radar',
      'Your password reset code is: $verificationCode',
      '<html><body><h1>Password Reset</h1><p>Your password reset code is: <strong>$verificationCode</strong></p></body></html>',
    );
  }

  Future<bool> _sendEmail(
    Session session,
    String toEmail,
    String subject,
    String textContent,
    String htmlContent,
  ) async {
    final apiKey = session.serverpod.getPassword('sendGridApiKey');
    final senderEmail = session.serverpod.getPassword('senderEmail') ?? 'info@rootradar.com';

    if (apiKey == null) {
      session.log(
        'SendGrid API key not found. Logging email instead:\n'
        'To: $toEmail\n'
        'Subject: $subject\n'
        'Content: $textContent',
        level: LogLevel.warning,
      );
      return false;
    }

    try {
      final response = await http.post(
        Uri.parse('https://api.sendgrid.com/v3/mail/send'),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'personalizations': [
            {
              'to': [
                {'email': toEmail}
              ],
              'subject': subject,
            }
          ],
          'from': {'email': senderEmail, 'name': 'Root Radar'},
          'content': [
            {'type': 'text/plain', 'value': textContent},
            {'type': 'text/html', 'value': htmlContent},
          ],
        }),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        session.log(
          'Failed to send email via SendGrid. Status: ${response.statusCode}, Body: ${response.body}',
          level: LogLevel.error,
        );
        return false;
      }
    } catch (e, stackTrace) {
      session.log(
        'Error sending email via SendGrid: $e',
        level: LogLevel.error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }
}
