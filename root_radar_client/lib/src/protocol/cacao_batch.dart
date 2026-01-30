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

abstract class CacaoBatch implements _i1.SerializableModel {
  CacaoBatch._({
    this.id,
    required this.name,
    required this.status,
    required this.stage,
    required this.startedAt,
    this.lastStirredAt,
    this.weight,
    this.userInfoId,
  });

  factory CacaoBatch({
    int? id,
    required String name,
    required String status,
    required String stage,
    required DateTime startedAt,
    DateTime? lastStirredAt,
    double? weight,
    int? userInfoId,
  }) = _CacaoBatchImpl;

  factory CacaoBatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return CacaoBatch(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      status: jsonSerialization['status'] as String,
      stage: jsonSerialization['stage'] as String,
      startedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      lastStirredAt: jsonSerialization['lastStirredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastStirredAt'],
            ),
      weight: (jsonSerialization['weight'] as num?)?.toDouble(),
      userInfoId: jsonSerialization['userInfoId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String status;

  String stage;

  DateTime startedAt;

  DateTime? lastStirredAt;

  double? weight;

  int? userInfoId;

  /// Returns a shallow copy of this [CacaoBatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CacaoBatch copyWith({
    int? id,
    String? name,
    String? status,
    String? stage,
    DateTime? startedAt,
    DateTime? lastStirredAt,
    double? weight,
    int? userInfoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CacaoBatch',
      if (id != null) 'id': id,
      'name': name,
      'status': status,
      'stage': stage,
      'startedAt': startedAt.toJson(),
      if (lastStirredAt != null) 'lastStirredAt': lastStirredAt?.toJson(),
      if (weight != null) 'weight': weight,
      if (userInfoId != null) 'userInfoId': userInfoId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CacaoBatchImpl extends CacaoBatch {
  _CacaoBatchImpl({
    int? id,
    required String name,
    required String status,
    required String stage,
    required DateTime startedAt,
    DateTime? lastStirredAt,
    double? weight,
    int? userInfoId,
  }) : super._(
         id: id,
         name: name,
         status: status,
         stage: stage,
         startedAt: startedAt,
         lastStirredAt: lastStirredAt,
         weight: weight,
         userInfoId: userInfoId,
       );

  /// Returns a shallow copy of this [CacaoBatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CacaoBatch copyWith({
    Object? id = _Undefined,
    String? name,
    String? status,
    String? stage,
    DateTime? startedAt,
    Object? lastStirredAt = _Undefined,
    Object? weight = _Undefined,
    Object? userInfoId = _Undefined,
  }) {
    return CacaoBatch(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      stage: stage ?? this.stage,
      startedAt: startedAt ?? this.startedAt,
      lastStirredAt: lastStirredAt is DateTime?
          ? lastStirredAt
          : this.lastStirredAt,
      weight: weight is double? ? weight : this.weight,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
    );
  }
}
