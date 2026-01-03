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

abstract class Plant implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Plant._({
    this.id,
    required this.name,
    this.variety,
    required this.plantedAt,
    this.daysToHarvest,
    this.category,
    this.plantType,
    this.latitude,
    this.longitude,
    required this.anchorId,
    this.notes,
    this.imageUrl,
    this.userInfoId,
  });

  factory Plant({
    int? id,
    required String name,
    String? variety,
    required DateTime plantedAt,
    int? daysToHarvest,
    String? category,
    String? plantType,
    double? latitude,
    double? longitude,
    required String anchorId,
    String? notes,
    String? imageUrl,
    int? userInfoId,
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
      plantType: jsonSerialization['plantType'] as String?,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      anchorId: jsonSerialization['anchorId'] as String,
      notes: jsonSerialization['notes'] as String?,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int?,
    );
  }

  static final t = PlantTable();

  static const db = PlantRepository._();

  @override
  int? id;

  String name;

  String? variety;

  DateTime plantedAt;

  int? daysToHarvest;

  String? category;

  String? plantType;

  double? latitude;

  double? longitude;

  String anchorId;

  String? notes;

  String? imageUrl;

  int? userInfoId;

  @override
  _i1.Table<int?> get table => t;

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
    String? plantType,
    double? latitude,
    double? longitude,
    String? anchorId,
    String? notes,
    String? imageUrl,
    int? userInfoId,
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
      if (plantType != null) 'plantType': plantType,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'anchorId': anchorId,
      if (notes != null) 'notes': notes,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (userInfoId != null) 'userInfoId': userInfoId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Plant',
      if (id != null) 'id': id,
      'name': name,
      if (variety != null) 'variety': variety,
      'plantedAt': plantedAt.toJson(),
      if (daysToHarvest != null) 'daysToHarvest': daysToHarvest,
      if (category != null) 'category': category,
      if (plantType != null) 'plantType': plantType,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'anchorId': anchorId,
      if (notes != null) 'notes': notes,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (userInfoId != null) 'userInfoId': userInfoId,
    };
  }

  static PlantInclude include() {
    return PlantInclude._();
  }

  static PlantIncludeList includeList({
    _i1.WhereExpressionBuilder<PlantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlantTable>? orderByList,
    PlantInclude? include,
  }) {
    return PlantIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Plant.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Plant.t),
      include: include,
    );
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
    String? plantType,
    double? latitude,
    double? longitude,
    required String anchorId,
    String? notes,
    String? imageUrl,
    int? userInfoId,
  }) : super._(
         id: id,
         name: name,
         variety: variety,
         plantedAt: plantedAt,
         daysToHarvest: daysToHarvest,
         category: category,
         plantType: plantType,
         latitude: latitude,
         longitude: longitude,
         anchorId: anchorId,
         notes: notes,
         imageUrl: imageUrl,
         userInfoId: userInfoId,
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
    Object? plantType = _Undefined,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    String? anchorId,
    Object? notes = _Undefined,
    Object? imageUrl = _Undefined,
    Object? userInfoId = _Undefined,
  }) {
    return Plant(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      variety: variety is String? ? variety : this.variety,
      plantedAt: plantedAt ?? this.plantedAt,
      daysToHarvest: daysToHarvest is int? ? daysToHarvest : this.daysToHarvest,
      category: category is String? ? category : this.category,
      plantType: plantType is String? ? plantType : this.plantType,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      anchorId: anchorId ?? this.anchorId,
      notes: notes is String? ? notes : this.notes,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
    );
  }
}

class PlantUpdateTable extends _i1.UpdateTable<PlantTable> {
  PlantUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> variety(String? value) => _i1.ColumnValue(
    table.variety,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> plantedAt(DateTime value) =>
      _i1.ColumnValue(
        table.plantedAt,
        value,
      );

  _i1.ColumnValue<int, int> daysToHarvest(int? value) => _i1.ColumnValue(
    table.daysToHarvest,
    value,
  );

  _i1.ColumnValue<String, String> category(String? value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<String, String> plantType(String? value) => _i1.ColumnValue(
    table.plantType,
    value,
  );

  _i1.ColumnValue<double, double> latitude(double? value) => _i1.ColumnValue(
    table.latitude,
    value,
  );

  _i1.ColumnValue<double, double> longitude(double? value) => _i1.ColumnValue(
    table.longitude,
    value,
  );

  _i1.ColumnValue<String, String> anchorId(String value) => _i1.ColumnValue(
    table.anchorId,
    value,
  );

  _i1.ColumnValue<String, String> notes(String? value) => _i1.ColumnValue(
    table.notes,
    value,
  );

  _i1.ColumnValue<String, String> imageUrl(String? value) => _i1.ColumnValue(
    table.imageUrl,
    value,
  );

  _i1.ColumnValue<int, int> userInfoId(int? value) => _i1.ColumnValue(
    table.userInfoId,
    value,
  );
}

class PlantTable extends _i1.Table<int?> {
  PlantTable({super.tableRelation}) : super(tableName: 'plant') {
    updateTable = PlantUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    variety = _i1.ColumnString(
      'variety',
      this,
    );
    plantedAt = _i1.ColumnDateTime(
      'plantedAt',
      this,
    );
    daysToHarvest = _i1.ColumnInt(
      'daysToHarvest',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    plantType = _i1.ColumnString(
      'plantType',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
    anchorId = _i1.ColumnString(
      'anchorId',
      this,
    );
    notes = _i1.ColumnString(
      'notes',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final PlantUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString variety;

  late final _i1.ColumnDateTime plantedAt;

  late final _i1.ColumnInt daysToHarvest;

  late final _i1.ColumnString category;

  late final _i1.ColumnString plantType;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  late final _i1.ColumnString anchorId;

  late final _i1.ColumnString notes;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnInt userInfoId;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    variety,
    plantedAt,
    daysToHarvest,
    category,
    plantType,
    latitude,
    longitude,
    anchorId,
    notes,
    imageUrl,
    userInfoId,
  ];
}

class PlantInclude extends _i1.IncludeObject {
  PlantInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Plant.t;
}

class PlantIncludeList extends _i1.IncludeList {
  PlantIncludeList._({
    _i1.WhereExpressionBuilder<PlantTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Plant.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Plant.t;
}

class PlantRepository {
  const PlantRepository._();

  /// Returns a list of [Plant]s matching the given query parameters.
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
  Future<List<Plant>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Plant>(
      where: where?.call(Plant.t),
      orderBy: orderBy?.call(Plant.t),
      orderByList: orderByList?.call(Plant.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Plant] matching the given query parameters.
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
  Future<Plant?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlantTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Plant>(
      where: where?.call(Plant.t),
      orderBy: orderBy?.call(Plant.t),
      orderByList: orderByList?.call(Plant.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Plant] by its [id] or null if no such row exists.
  Future<Plant?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Plant>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Plant]s in the list and returns the inserted rows.
  ///
  /// The returned [Plant]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Plant>> insert(
    _i1.Session session,
    List<Plant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Plant>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Plant] and returns the inserted row.
  ///
  /// The returned [Plant] will have its `id` field set.
  Future<Plant> insertRow(
    _i1.Session session,
    Plant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Plant>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Plant]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Plant>> update(
    _i1.Session session,
    List<Plant> rows, {
    _i1.ColumnSelections<PlantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Plant>(
      rows,
      columns: columns?.call(Plant.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Plant]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Plant> updateRow(
    _i1.Session session,
    Plant row, {
    _i1.ColumnSelections<PlantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Plant>(
      row,
      columns: columns?.call(Plant.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Plant] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Plant?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlantUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Plant>(
      id,
      columnValues: columnValues(Plant.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Plant]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Plant>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlantUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PlantTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlantTable>? orderBy,
    _i1.OrderByListBuilder<PlantTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Plant>(
      columnValues: columnValues(Plant.t.updateTable),
      where: where(Plant.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Plant.t),
      orderByList: orderByList?.call(Plant.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Plant]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Plant>> delete(
    _i1.Session session,
    List<Plant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Plant>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Plant].
  Future<Plant> deleteRow(
    _i1.Session session,
    Plant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Plant>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Plant>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlantTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Plant>(
      where: where(Plant.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlantTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Plant>(
      where: where?.call(Plant.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
