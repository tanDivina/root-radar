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

abstract class Fermentation implements _i1.SerializableModel {
  Fermentation._({
    this.id,
    required this.name,
    this.harvestId,
    required this.startedAt,
    required this.status,
    this.instructions,
    this.lastTurnedAt,
    this.nextTurnAt,
    this.notes,
    this.userInfoId,
  });

  factory Fermentation({
    int? id,
    required String name,
    int? harvestId,
    required DateTime startedAt,
    required String status,
    String? instructions,
    DateTime? lastTurnedAt,
    DateTime? nextTurnAt,
    String? notes,
    int? userInfoId,
  }) = _FermentationImpl;

  factory Fermentation.fromJson(Map<String, dynamic> jsonSerialization) {
    return Fermentation(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      harvestId: jsonSerialization['harvestId'] as int?,
      startedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      status: jsonSerialization['status'] as String,
      instructions: jsonSerialization['instructions'] as String?,
      lastTurnedAt: jsonSerialization['lastTurnedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastTurnedAt'],
            ),
      nextTurnAt: jsonSerialization['nextTurnAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['nextTurnAt']),
      notes: jsonSerialization['notes'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int? harvestId;

  DateTime startedAt;

  String status;

  String? instructions;

  DateTime? lastTurnedAt;

  DateTime? nextTurnAt;

  String? notes;

  int? userInfoId;

  /// Returns a shallow copy of this [Fermentation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Fermentation copyWith({
    int? id,
    String? name,
    int? harvestId,
    DateTime? startedAt,
    String? status,
    String? instructions,
    DateTime? lastTurnedAt,
    DateTime? nextTurnAt,
    String? notes,
    int? userInfoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Fermentation',
      if (id != null) 'id': id,
      'name': name,
      if (harvestId != null) 'harvestId': harvestId,
      'startedAt': startedAt.toJson(),
      'status': status,
      if (instructions != null) 'instructions': instructions,
      if (lastTurnedAt != null) 'lastTurnedAt': lastTurnedAt?.toJson(),
      if (nextTurnAt != null) 'nextTurnAt': nextTurnAt?.toJson(),
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

class _FermentationImpl extends Fermentation {
  _FermentationImpl({
    int? id,
    required String name,
    int? harvestId,
    required DateTime startedAt,
    required String status,
    String? instructions,
    DateTime? lastTurnedAt,
    DateTime? nextTurnAt,
    String? notes,
    int? userInfoId,
  }) : super._(
         id: id,
         name: name,
         harvestId: harvestId,
         startedAt: startedAt,
         status: status,
         instructions: instructions,
         lastTurnedAt: lastTurnedAt,
         nextTurnAt: nextTurnAt,
         notes: notes,
         userInfoId: userInfoId,
       );

  /// Returns a shallow copy of this [Fermentation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Fermentation copyWith({
    Object? id = _Undefined,
    String? name,
    Object? harvestId = _Undefined,
    DateTime? startedAt,
    String? status,
    Object? instructions = _Undefined,
    Object? lastTurnedAt = _Undefined,
    Object? nextTurnAt = _Undefined,
    Object? notes = _Undefined,
    Object? userInfoId = _Undefined,
  }) {
    return Fermentation(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      harvestId: harvestId is int? ? harvestId : this.harvestId,
      startedAt: startedAt ?? this.startedAt,
      status: status ?? this.status,
      instructions: instructions is String? ? instructions : this.instructions,
      lastTurnedAt: lastTurnedAt is DateTime?
          ? lastTurnedAt
          : this.lastTurnedAt,
      nextTurnAt: nextTurnAt is DateTime? ? nextTurnAt : this.nextTurnAt,
      notes: notes is String? ? notes : this.notes,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
    );
  }
}
