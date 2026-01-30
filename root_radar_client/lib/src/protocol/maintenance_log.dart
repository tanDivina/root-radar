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

abstract class MaintenanceLog implements _i1.SerializableModel {
  MaintenanceLog._({
    this.id,
    required this.plantId,
    required this.type,
    required this.timestamp,
    this.notes,
    this.userInfoId,
  });

  factory MaintenanceLog({
    int? id,
    required int plantId,
    required String type,
    required DateTime timestamp,
    String? notes,
    int? userInfoId,
  }) = _MaintenanceLogImpl;

  factory MaintenanceLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return MaintenanceLog(
      id: jsonSerialization['id'] as int?,
      plantId: jsonSerialization['plantId'] as int,
      type: jsonSerialization['type'] as String,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      notes: jsonSerialization['notes'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int plantId;

  String type;

  DateTime timestamp;

  String? notes;

  int? userInfoId;

  /// Returns a shallow copy of this [MaintenanceLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MaintenanceLog copyWith({
    int? id,
    int? plantId,
    String? type,
    DateTime? timestamp,
    String? notes,
    int? userInfoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MaintenanceLog',
      if (id != null) 'id': id,
      'plantId': plantId,
      'type': type,
      'timestamp': timestamp.toJson(),
      if (notes != null) 'notes': notes,
      if (userInfoId != null) 'userInfoId': userInfoId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MaintenanceLogImpl extends MaintenanceLog {
  _MaintenanceLogImpl({
    int? id,
    required int plantId,
    required String type,
    required DateTime timestamp,
    String? notes,
    int? userInfoId,
  }) : super._(
         id: id,
         plantId: plantId,
         type: type,
         timestamp: timestamp,
         notes: notes,
         userInfoId: userInfoId,
       );

  /// Returns a shallow copy of this [MaintenanceLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MaintenanceLog copyWith({
    Object? id = _Undefined,
    int? plantId,
    String? type,
    DateTime? timestamp,
    Object? notes = _Undefined,
    Object? userInfoId = _Undefined,
  }) {
    return MaintenanceLog(
      id: id is int? ? id : this.id,
      plantId: plantId ?? this.plantId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      notes: notes is String? ? notes : this.notes,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
    );
  }
}
