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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class PlantPhoto
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = PlantPhotoTable();

  static const db = PlantPhotoRepository._();

  @override
  int? id;

  int plantId;

  String imageUrl;

  DateTime timestamp;

  String? notes;

  int? userInfoId;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static PlantPhotoInclude include() {
    return PlantPhotoInclude._();
  }

  static PlantPhotoIncludeList includeList({
    _i1.WhereExpressionBuilder<PlantPhotoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlantPhotoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlantPhotoTable>? orderByList,
    PlantPhotoInclude? include,
  }) {
    return PlantPhotoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlantPhoto.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlantPhoto.t),
      include: include,
    );
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

class PlantPhotoUpdateTable extends _i1.UpdateTable<PlantPhotoTable> {
  PlantPhotoUpdateTable(super.table);

  _i1.ColumnValue<int, int> plantId(int value) => _i1.ColumnValue(
    table.plantId,
    value,
  );

  _i1.ColumnValue<String, String> imageUrl(String value) => _i1.ColumnValue(
    table.imageUrl,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _i1.ColumnValue(
        table.timestamp,
        value,
      );

  _i1.ColumnValue<String, String> notes(String? value) => _i1.ColumnValue(
    table.notes,
    value,
  );

  _i1.ColumnValue<int, int> userInfoId(int? value) => _i1.ColumnValue(
    table.userInfoId,
    value,
  );
}

class PlantPhotoTable extends _i1.Table<int?> {
  PlantPhotoTable({super.tableRelation}) : super(tableName: 'plant_photo') {
    updateTable = PlantPhotoUpdateTable(this);
    plantId = _i1.ColumnInt(
      'plantId',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    notes = _i1.ColumnString(
      'notes',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final PlantPhotoUpdateTable updateTable;

  late final _i1.ColumnInt plantId;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnString notes;

  late final _i1.ColumnInt userInfoId;

  @override
  List<_i1.Column> get columns => [
    id,
    plantId,
    imageUrl,
    timestamp,
    notes,
    userInfoId,
  ];
}

class PlantPhotoInclude extends _i1.IncludeObject {
  PlantPhotoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => PlantPhoto.t;
}

class PlantPhotoIncludeList extends _i1.IncludeList {
  PlantPhotoIncludeList._({
    _i1.WhereExpressionBuilder<PlantPhotoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlantPhoto.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PlantPhoto.t;
}

class PlantPhotoRepository {
  const PlantPhotoRepository._();

  /// Returns a list of [PlantPhoto]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<PlantPhoto>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlantPhotoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlantPhotoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlantPhotoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PlantPhoto>(
      where: where?.call(PlantPhoto.t),
      orderBy: orderBy?.call(PlantPhoto.t),
      orderByList: orderByList?.call(PlantPhoto.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [PlantPhoto] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<PlantPhoto?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlantPhotoTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlantPhotoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlantPhotoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<PlantPhoto>(
      where: where?.call(PlantPhoto.t),
      orderBy: orderBy?.call(PlantPhoto.t),
      orderByList: orderByList?.call(PlantPhoto.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [PlantPhoto] by its [id] or null if no such row exists.
  Future<PlantPhoto?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<PlantPhoto>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [PlantPhoto]s in the list and returns the inserted rows.
  ///
  /// The returned [PlantPhoto]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PlantPhoto>> insert(
    _i1.Session session,
    List<PlantPhoto> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlantPhoto>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PlantPhoto] and returns the inserted row.
  ///
  /// The returned [PlantPhoto] will have its `id` field set.
  Future<PlantPhoto> insertRow(
    _i1.Session session,
    PlantPhoto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlantPhoto>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlantPhoto]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlantPhoto>> update(
    _i1.Session session,
    List<PlantPhoto> rows, {
    _i1.ColumnSelections<PlantPhotoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlantPhoto>(
      rows,
      columns: columns?.call(PlantPhoto.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlantPhoto]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlantPhoto> updateRow(
    _i1.Session session,
    PlantPhoto row, {
    _i1.ColumnSelections<PlantPhotoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlantPhoto>(
      row,
      columns: columns?.call(PlantPhoto.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlantPhoto] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlantPhoto?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlantPhotoUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlantPhoto>(
      id,
      columnValues: columnValues(PlantPhoto.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlantPhoto]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlantPhoto>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlantPhotoUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PlantPhotoTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlantPhotoTable>? orderBy,
    _i1.OrderByListBuilder<PlantPhotoTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlantPhoto>(
      columnValues: columnValues(PlantPhoto.t.updateTable),
      where: where(PlantPhoto.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlantPhoto.t),
      orderByList: orderByList?.call(PlantPhoto.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlantPhoto]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlantPhoto>> delete(
    _i1.Session session,
    List<PlantPhoto> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlantPhoto>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlantPhoto].
  Future<PlantPhoto> deleteRow(
    _i1.Session session,
    PlantPhoto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlantPhoto>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlantPhoto>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlantPhotoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlantPhoto>(
      where: where(PlantPhoto.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlantPhotoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlantPhoto>(
      where: where?.call(PlantPhoto.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
