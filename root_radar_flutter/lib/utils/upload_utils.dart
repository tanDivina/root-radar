import 'dart:typed_data';
import 'package:root_radar_client/root_radar_client.dart';

extension FileUploaderBytes on FileUploader {
  /// Uploads the provided [bytes] as a stream.
  /// This is a convenience method for when you have a [Uint8List] 
  /// (e.g. from XFile.readAsBytes()) and don't want to manually create a Stream.
  Future<bool> uploadBytes(Uint8List bytes) async {
    return await upload(Stream.value(bytes));
  }
}
