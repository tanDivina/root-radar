/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ButlerMessage implements _i1.SerializableModel {
  ButlerMessage._({
    this.id,
    required this.message,
    required this.timestamp,
    required this.type,
    required this.userInfoId,
  });

  factory ButlerMessage({
    int? id,
    required String message,
    required DateTime timestamp,
    required String type,
    required int userInfoId,
  }) = _ButlerMessageImpl;

  factory ButlerMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return ButlerMessage(
      id: jsonSerialization['id'] as int?,
      message: jsonSerialization['message'] as String,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      type: jsonSerialization['type'] as String,
      userInfoId: jsonSerialization['userInfoId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String message;

  DateTime timestamp;

  String type;

  int userInfoId;

  /// Returns a shallow copy of this [ButlerMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ButlerMessage copyWith({
    int? id,
    String? message,
    DateTime? timestamp,
    String? type,
    int? userInfoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ButlerMessage',
      if (id != null) 'id': id,
      'message': message,
      'timestamp': timestamp.toJson(),
      'type': type,
      'userInfoId': userInfoId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ButlerMessageImpl extends ButlerMessage {
  _ButlerMessageImpl({
    int? id,
    required String message,
    required DateTime timestamp,
    required String type,
    required int userInfoId,
  }) : super._(
         id: id,
         message: message,
         timestamp: timestamp,
         type: type,
         userInfoId: userInfoId,
       );

  /// Returns a shallow copy of this [ButlerMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ButlerMessage copyWith({
    Object? id = _Undefined,
    String? message,
    DateTime? timestamp,
    String? type,
    int? userInfoId,
  }) {
    return ButlerMessage(
      id: id is int? ? id : this.id,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      userInfoId: userInfoId ?? this.userInfoId,
    );
  }
}
