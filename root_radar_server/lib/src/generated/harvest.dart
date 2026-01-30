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

abstract class Harvest
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = HarvestTable();

  static const db = HarvestRepository._();

  @override
  int? id;

  String name;

  int? plantId;

  DateTime harvestedAt;

  double? weight;

  String? quality;

  String? notes;

  int? userInfoId;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static HarvestInclude include() {
    return HarvestInclude._();
  }

  static HarvestIncludeList includeList({
    _i1.WhereExpressionBuilder<HarvestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HarvestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HarvestTable>? orderByList,
    HarvestInclude? include,
  }) {
    return HarvestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Harvest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Harvest.t),
      include: include,
    );
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

class HarvestUpdateTable extends _i1.UpdateTable<HarvestTable> {
  HarvestUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<int, int> plantId(int? value) => _i1.ColumnValue(
    table.plantId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> harvestedAt(DateTime value) =>
      _i1.ColumnValue(
        table.harvestedAt,
        value,
      );

  _i1.ColumnValue<double, double> weight(double? value) => _i1.ColumnValue(
    table.weight,
    value,
  );

  _i1.ColumnValue<String, String> quality(String? value) => _i1.ColumnValue(
    table.quality,
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

class HarvestTable extends _i1.Table<int?> {
  HarvestTable({super.tableRelation}) : super(tableName: 'harvest') {
    updateTable = HarvestUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    plantId = _i1.ColumnInt(
      'plantId',
      this,
    );
    harvestedAt = _i1.ColumnDateTime(
      'harvestedAt',
      this,
    );
    weight = _i1.ColumnDouble(
      'weight',
      this,
    );
    quality = _i1.ColumnString(
      'quality',
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

  late final HarvestUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnInt plantId;

  late final _i1.ColumnDateTime harvestedAt;

  late final _i1.ColumnDouble weight;

  late final _i1.ColumnString quality;

  late final _i1.ColumnString notes;

  late final _i1.ColumnInt userInfoId;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    plantId,
    harvestedAt,
    weight,
    quality,
    notes,
    userInfoId,
  ];
}

class HarvestInclude extends _i1.IncludeObject {
  HarvestInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Harvest.t;
}

class HarvestIncludeList extends _i1.IncludeList {
  HarvestIncludeList._({
    _i1.WhereExpressionBuilder<HarvestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Harvest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Harvest.t;
}

class HarvestRepository {
  const HarvestRepository._();

  /// Returns a list of [Harvest]s matching the given query parameters.
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
  Future<List<Harvest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HarvestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HarvestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HarvestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Harvest>(
      where: where?.call(Harvest.t),
      orderBy: orderBy?.call(Harvest.t),
      orderByList: orderByList?.call(Harvest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Harvest] matching the given query parameters.
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
  Future<Harvest?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HarvestTable>? where,
    int? offset,
    _i1.OrderByBuilder<HarvestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HarvestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Harvest>(
      where: where?.call(Harvest.t),
      orderBy: orderBy?.call(Harvest.t),
      orderByList: orderByList?.call(Harvest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Harvest] by its [id] or null if no such row exists.
  Future<Harvest?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Harvest>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Harvest]s in the list and returns the inserted rows.
  ///
  /// The returned [Harvest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Harvest>> insert(
    _i1.Session session,
    List<Harvest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Harvest>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Harvest] and returns the inserted row.
  ///
  /// The returned [Harvest] will have its `id` field set.
  Future<Harvest> insertRow(
    _i1.Session session,
    Harvest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Harvest>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Harvest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Harvest>> update(
    _i1.Session session,
    List<Harvest> rows, {
    _i1.ColumnSelections<HarvestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Harvest>(
      rows,
      columns: columns?.call(Harvest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Harvest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Harvest> updateRow(
    _i1.Session session,
    Harvest row, {
    _i1.ColumnSelections<HarvestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Harvest>(
      row,
      columns: columns?.call(Harvest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Harvest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Harvest?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<HarvestUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Harvest>(
      id,
      columnValues: columnValues(Harvest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Harvest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Harvest>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<HarvestUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<HarvestTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HarvestTable>? orderBy,
    _i1.OrderByListBuilder<HarvestTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Harvest>(
      columnValues: columnValues(Harvest.t.updateTable),
      where: where(Harvest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Harvest.t),
      orderByList: orderByList?.call(Harvest.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Harvest]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Harvest>> delete(
    _i1.Session session,
    List<Harvest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Harvest>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Harvest].
  Future<Harvest> deleteRow(
    _i1.Session session,
    Harvest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Harvest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Harvest>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<HarvestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Harvest>(
      where: where(Harvest.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HarvestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Harvest>(
      where: where?.call(Harvest.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
