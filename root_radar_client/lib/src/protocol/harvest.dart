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

abstract class Harvest implements _i1.SerializableModel {
  Harvest._({
    this.id,
    required this.name,
    this.plantId,
    required this.harvestedAt,
    this.weight,
    this.quality,
    this.notes,
    this.userInfoId,
  });

  factory Harvest({
    int? id,
    required String name,
    int? plantId,
    required DateTime harvestedAt,
    double? weight,
    String? quality,
    String? notes,
    int? userInfoId,
  }) = _HarvestImpl;

  factory Harvest.fromJson(Map<String, dynamic> jsonSerialization) {
    return Harvest(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      plantId: jsonSerialization['plantId'] as int?,
      harvestedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['harvestedAt'],
      ),
      weight: (jsonSerialization['weight'] as num?)?.toDouble(),
      quality: jsonSerialization['quality'] as String?,
      notes: jsonSerialization['notes'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int? plantId;

  DateTime harvestedAt;

  double? weight;

  String? quality;

  String? notes;

  int? userInfoId;

  /// Returns a shallow copy of this [Harvest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Harvest copyWith({
    int? id,
    String? name,
    int? plantId,
    DateTime? harvestedAt,
    double? weight,
    String? quality,
    String? notes,
    int? userInfoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Harvest',
      if (id != null) 'id': id,
      'name': name,
      if (plantId != null) 'plantId': plantId,
      'harvestedAt': harvestedAt.toJson(),
      if (weight != null) 'weight': weight,
      if (quality != null) 'quality': quality,
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

class _HarvestImpl extends Harvest {
  _HarvestImpl({
    int? id,
    required String name,
    int? plantId,
    required DateTime harvestedAt,
    double? weight,
    String? quality,
    String? notes,
    int? userInfoId,
  }) : super._(
         id: id,
         name: name,
         plantId: plantId,
         harvestedAt: harvestedAt,
         weight: weight,
         quality: quality,
         notes: notes,
         userInfoId: userInfoId,
       );

  /// Returns a shallow copy of this [Harvest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Harvest copyWith({
    Object? id = _Undefined,
    String? name,
    Object? plantId = _Undefined,
    DateTime? harvestedAt,
    Object? weight = _Undefined,
    Object? quality = _Undefined,
    Object? notes = _Undefined,
    Object? userInfoId = _Undefined,
  }) {
    return Harvest(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      plantId: plantId is int? ? plantId : this.plantId,
      harvestedAt: harvestedAt ?? this.harvestedAt,
      weight: weight is double? ? weight : this.weight,
      quality: quality is String? ? quality : this.quality,
      notes: notes is String? ? notes : this.notes,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
    );
  }
}
