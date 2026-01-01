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

abstract class Plant implements _i1.SerializableModel {
  Plant._({
    this.id,
    required this.name,
    this.variety,
    required this.plantedAt,
    this.daysToHarvest,
    this.category,
    required this.anchorId,
    this.notes,
  });

  factory Plant({
    int? id,
    required String name,
    String? variety,
    required DateTime plantedAt,
    int? daysToHarvest,
    String? category,
    required String anchorId,
    String? notes,
  }) = _PlantImpl;

  factory Plant.fromJson(Map<String, dynamic> jsonSerialization) {
    return Plant(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      variety: jsonSerialization['variety'] as String?,
      plantedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['plantedAt'],
      ),
      daysToHarvest: jsonSerialization['daysToHarvest'] as int?,
      category: jsonSerialization['category'] as String?,
      anchorId: jsonSerialization['anchorId'] as String,
      notes: jsonSerialization['notes'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? variety;

  DateTime plantedAt;

  int? daysToHarvest;

  String? category;

  String anchorId;

  String? notes;

  /// Returns a shallow copy of this [Plant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Plant copyWith({
    int? id,
    String? name,
    String? variety,
    DateTime? plantedAt,
    int? daysToHarvest,
    String? category,
    String? anchorId,
    String? notes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Plant',
      if (id != null) 'id': id,
      'name': name,
      if (variety != null) 'variety': variety,
      'plantedAt': plantedAt.toJson(),
      if (daysToHarvest != null) 'daysToHarvest': daysToHarvest,
      if (category != null) 'category': category,
      'anchorId': anchorId,
      if (notes != null) 'notes': notes,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlantImpl extends Plant {
  _PlantImpl({
    int? id,
    required String name,
    String? variety,
    required DateTime plantedAt,
    int? daysToHarvest,
    String? category,
    required String anchorId,
    String? notes,
  }) : super._(
         id: id,
         name: name,
         variety: variety,
         plantedAt: plantedAt,
         daysToHarvest: daysToHarvest,
         category: category,
         anchorId: anchorId,
         notes: notes,
       );

  /// Returns a shallow copy of this [Plant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Plant copyWith({
    Object? id = _Undefined,
    String? name,
    Object? variety = _Undefined,
    DateTime? plantedAt,
    Object? daysToHarvest = _Undefined,
    Object? category = _Undefined,
    String? anchorId,
    Object? notes = _Undefined,
  }) {
    return Plant(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      variety: variety is String? ? variety : this.variety,
      plantedAt: plantedAt ?? this.plantedAt,
      daysToHarvest: daysToHarvest is int? ? daysToHarvest : this.daysToHarvest,
      category: category is String? ? category : this.category,
      anchorId: anchorId ?? this.anchorId,
      notes: notes is String? ? notes : this.notes,
    );
  }
}
