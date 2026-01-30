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

abstract class MaintenanceLog
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = MaintenanceLogTable();

  static const db = MaintenanceLogRepository._();

  @override
  int? id;

  int plantId;

  String type;

  DateTime timestamp;

  String? notes;

  int? userInfoId;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static MaintenanceLogInclude include() {
    return MaintenanceLogInclude._();
  }

  static MaintenanceLogIncludeList includeList({
    _i1.WhereExpressionBuilder<MaintenanceLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaintenanceLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaintenanceLogTable>? orderByList,
    MaintenanceLogInclude? include,
  }) {
    return MaintenanceLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MaintenanceLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MaintenanceLog.t),
      include: include,
    );
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

class MaintenanceLogUpdateTable extends _i1.UpdateTable<MaintenanceLogTable> {
  MaintenanceLogUpdateTable(super.table);

  _i1.ColumnValue<int, int> plantId(int value) => _i1.ColumnValue(
    table.plantId,
    value,
  );

  _i1.ColumnValue<String, String> type(String value) => _i1.ColumnValue(
    table.type,
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

class MaintenanceLogTable extends _i1.Table<int?> {
  MaintenanceLogTable({super.tableRelation})
    : super(tableName: 'maintenance_log') {
    updateTable = MaintenanceLogUpdateTable(this);
    plantId = _i1.ColumnInt(
      'plantId',
      this,
    );
    type = _i1.ColumnString(
      'type',
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

  late final MaintenanceLogUpdateTable updateTable;

  late final _i1.ColumnInt plantId;

  late final _i1.ColumnString type;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnString notes;

  late final _i1.ColumnInt userInfoId;

  @override
  List<_i1.Column> get columns => [
    id,
    plantId,
    type,
    timestamp,
    notes,
    userInfoId,
  ];
}

class MaintenanceLogInclude extends _i1.IncludeObject {
  MaintenanceLogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MaintenanceLog.t;
}

class MaintenanceLogIncludeList extends _i1.IncludeList {
  MaintenanceLogIncludeList._({
    _i1.WhereExpressionBuilder<MaintenanceLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MaintenanceLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MaintenanceLog.t;
}

class MaintenanceLogRepository {
  const MaintenanceLogRepository._();

  /// Returns a list of [MaintenanceLog]s matching the given query parameters.
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
  Future<List<MaintenanceLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MaintenanceLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaintenanceLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaintenanceLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MaintenanceLog>(
      where: where?.call(MaintenanceLog.t),
      orderBy: orderBy?.call(MaintenanceLog.t),
      orderByList: orderByList?.call(MaintenanceLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MaintenanceLog] matching the given query parameters.
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
  Future<MaintenanceLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MaintenanceLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<MaintenanceLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaintenanceLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MaintenanceLog>(
      where: where?.call(MaintenanceLog.t),
      orderBy: orderBy?.call(MaintenanceLog.t),
      orderByList: orderByList?.call(MaintenanceLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MaintenanceLog] by its [id] or null if no such row exists.
  Future<MaintenanceLog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MaintenanceLog>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MaintenanceLog]s in the list and returns the inserted rows.
  ///
  /// The returned [MaintenanceLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MaintenanceLog>> insert(
    _i1.Session session,
    List<MaintenanceLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MaintenanceLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MaintenanceLog] and returns the inserted row.
  ///
  /// The returned [MaintenanceLog] will have its `id` field set.
  Future<MaintenanceLog> insertRow(
    _i1.Session session,
    MaintenanceLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MaintenanceLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MaintenanceLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MaintenanceLog>> update(
    _i1.Session session,
    List<MaintenanceLog> rows, {
    _i1.ColumnSelections<MaintenanceLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MaintenanceLog>(
      rows,
      columns: columns?.call(MaintenanceLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MaintenanceLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MaintenanceLog> updateRow(
    _i1.Session session,
    MaintenanceLog row, {
    _i1.ColumnSelections<MaintenanceLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MaintenanceLog>(
      row,
      columns: columns?.call(MaintenanceLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MaintenanceLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MaintenanceLog?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MaintenanceLogUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MaintenanceLog>(
      id,
      columnValues: columnValues(MaintenanceLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MaintenanceLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MaintenanceLog>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MaintenanceLogUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MaintenanceLogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaintenanceLogTable>? orderBy,
    _i1.OrderByListBuilder<MaintenanceLogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MaintenanceLog>(
      columnValues: columnValues(MaintenanceLog.t.updateTable),
      where: where(MaintenanceLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MaintenanceLog.t),
      orderByList: orderByList?.call(MaintenanceLog.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MaintenanceLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MaintenanceLog>> delete(
    _i1.Session session,
    List<MaintenanceLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MaintenanceLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MaintenanceLog].
  Future<MaintenanceLog> deleteRow(
    _i1.Session session,
    MaintenanceLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MaintenanceLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MaintenanceLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MaintenanceLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MaintenanceLog>(
      where: where(MaintenanceLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MaintenanceLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MaintenanceLog>(
      where: where?.call(MaintenanceLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
