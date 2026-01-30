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

abstract class CacaoBatch
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = CacaoBatchTable();

  static const db = CacaoBatchRepository._();

  @override
  int? id;

  String name;

  String status;

  String stage;

  DateTime startedAt;

  DateTime? lastStirredAt;

  double? weight;

  int? userInfoId;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static CacaoBatchInclude include() {
    return CacaoBatchInclude._();
  }

  static CacaoBatchIncludeList includeList({
    _i1.WhereExpressionBuilder<CacaoBatchTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CacaoBatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CacaoBatchTable>? orderByList,
    CacaoBatchInclude? include,
  }) {
    return CacaoBatchIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CacaoBatch.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CacaoBatch.t),
      include: include,
    );
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

class CacaoBatchUpdateTable extends _i1.UpdateTable<CacaoBatchTable> {
  CacaoBatchUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> stage(String value) => _i1.ColumnValue(
    table.stage,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> startedAt(DateTime value) =>
      _i1.ColumnValue(
        table.startedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastStirredAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastStirredAt,
        value,
      );

  _i1.ColumnValue<double, double> weight(double? value) => _i1.ColumnValue(
    table.weight,
    value,
  );

  _i1.ColumnValue<int, int> userInfoId(int? value) => _i1.ColumnValue(
    table.userInfoId,
    value,
  );
}

class CacaoBatchTable extends _i1.Table<int?> {
  CacaoBatchTable({super.tableRelation}) : super(tableName: 'cacao_batch') {
    updateTable = CacaoBatchUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    stage = _i1.ColumnString(
      'stage',
      this,
    );
    startedAt = _i1.ColumnDateTime(
      'startedAt',
      this,
    );
    lastStirredAt = _i1.ColumnDateTime(
      'lastStirredAt',
      this,
    );
    weight = _i1.ColumnDouble(
      'weight',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final CacaoBatchUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString status;

  late final _i1.ColumnString stage;

  late final _i1.ColumnDateTime startedAt;

  late final _i1.ColumnDateTime lastStirredAt;

  late final _i1.ColumnDouble weight;

  late final _i1.ColumnInt userInfoId;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    status,
    stage,
    startedAt,
    lastStirredAt,
    weight,
    userInfoId,
  ];
}

class CacaoBatchInclude extends _i1.IncludeObject {
  CacaoBatchInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CacaoBatch.t;
}

class CacaoBatchIncludeList extends _i1.IncludeList {
  CacaoBatchIncludeList._({
    _i1.WhereExpressionBuilder<CacaoBatchTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CacaoBatch.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CacaoBatch.t;
}

class CacaoBatchRepository {
  const CacaoBatchRepository._();

  /// Returns a list of [CacaoBatch]s matching the given query parameters.
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
  Future<List<CacaoBatch>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CacaoBatchTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CacaoBatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CacaoBatchTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CacaoBatch>(
      where: where?.call(CacaoBatch.t),
      orderBy: orderBy?.call(CacaoBatch.t),
      orderByList: orderByList?.call(CacaoBatch.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CacaoBatch] matching the given query parameters.
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
  Future<CacaoBatch?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CacaoBatchTable>? where,
    int? offset,
    _i1.OrderByBuilder<CacaoBatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CacaoBatchTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CacaoBatch>(
      where: where?.call(CacaoBatch.t),
      orderBy: orderBy?.call(CacaoBatch.t),
      orderByList: orderByList?.call(CacaoBatch.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CacaoBatch] by its [id] or null if no such row exists.
  Future<CacaoBatch?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CacaoBatch>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CacaoBatch]s in the list and returns the inserted rows.
  ///
  /// The returned [CacaoBatch]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CacaoBatch>> insert(
    _i1.Session session,
    List<CacaoBatch> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CacaoBatch>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CacaoBatch] and returns the inserted row.
  ///
  /// The returned [CacaoBatch] will have its `id` field set.
  Future<CacaoBatch> insertRow(
    _i1.Session session,
    CacaoBatch row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CacaoBatch>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CacaoBatch]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CacaoBatch>> update(
    _i1.Session session,
    List<CacaoBatch> rows, {
    _i1.ColumnSelections<CacaoBatchTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CacaoBatch>(
      rows,
      columns: columns?.call(CacaoBatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CacaoBatch]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CacaoBatch> updateRow(
    _i1.Session session,
    CacaoBatch row, {
    _i1.ColumnSelections<CacaoBatchTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CacaoBatch>(
      row,
      columns: columns?.call(CacaoBatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CacaoBatch] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CacaoBatch?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CacaoBatchUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CacaoBatch>(
      id,
      columnValues: columnValues(CacaoBatch.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CacaoBatch]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CacaoBatch>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CacaoBatchUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CacaoBatchTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CacaoBatchTable>? orderBy,
    _i1.OrderByListBuilder<CacaoBatchTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CacaoBatch>(
      columnValues: columnValues(CacaoBatch.t.updateTable),
      where: where(CacaoBatch.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CacaoBatch.t),
      orderByList: orderByList?.call(CacaoBatch.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CacaoBatch]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CacaoBatch>> delete(
    _i1.Session session,
    List<CacaoBatch> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CacaoBatch>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CacaoBatch].
  Future<CacaoBatch> deleteRow(
    _i1.Session session,
    CacaoBatch row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CacaoBatch>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CacaoBatch>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CacaoBatchTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CacaoBatch>(
      where: where(CacaoBatch.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CacaoBatchTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CacaoBatch>(
      where: where?.call(CacaoBatch.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
