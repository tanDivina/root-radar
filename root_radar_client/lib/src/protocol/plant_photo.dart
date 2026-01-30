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

abstract class PlantPhoto implements _i1.SerializableModel {
  PlantPhoto._({
    this.id,
    required this.plantId,
    required this.imageUrl,
    required this.timestamp,
    this.notes,
    this.userInfoId,
  });

  factory PlantPhoto({
    int? id,
    required int plantId,
    required String imageUrl,
    required DateTime timestamp,
    String? notes,
    int? userInfoId,
  }) = _PlantPhotoImpl;

  factory PlantPhoto.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlantPhoto(
      id: jsonSerialization['id'] as int?,
      plantId: jsonSerialization['plantId'] as int,
      imageUrl: jsonSerialization['imageUrl'] as String,
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

  String imageUrl;

  DateTime timestamp;

  String? notes;

  int? userInfoId;

  /// Returns a shallow copy of this [PlantPhoto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlantPhoto copyWith({
    int? id,
    int? plantId,
    String? imageUrl,
    DateTime? timestamp,
    String? notes,
    int? userInfoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlantPhoto',
      if (id != null) 'id': id,
      'plantId': plantId,
      'imageUrl': imageUrl,
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

class _PlantPhotoImpl extends PlantPhoto {
  _PlantPhotoImpl({
    int? id,
    required int plantId,
    required String imageUrl,
    required DateTime timestamp,
    String? notes,
    int? userInfoId,
  }) : super._(
         id: id,
         plantId: plantId,
         imageUrl: imageUrl,
         timestamp: timestamp,
         notes: notes,
         userInfoId: userInfoId,
       );

  /// Returns a shallow copy of this [PlantPhoto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlantPhoto copyWith({
    Object? id = _Undefined,
    int? plantId,
    String? imageUrl,
    DateTime? timestamp,
    Object? notes = _Undefined,
    Object? userInfoId = _Undefined,
  }) {
    return PlantPhoto(
      id: id is int? ? id : this.id,
      plantId: plantId ?? this.plantId,
      imageUrl: imageUrl ?? this.imageUrl,
      timestamp: timestamp ?? this.timestamp,
      notes: notes is String? ? notes : this.notes,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
    );
  }
}
