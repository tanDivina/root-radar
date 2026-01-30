import 'dart:io';
import 'package:serverpod/serverpod.dart';

class DebugEndpoint extends Endpoint {
  Future<List<String>> listFiles(Session session) async {
    final webDir = Directory('web');
    if (!await webDir.exists()) {
      return ['web directory does not exist'];
    }
    
    final files = <String>[];
    await for (final entity in webDir.list(recursive: true)) {
      files.add(entity.path);
    }
    return files;
  }
}
