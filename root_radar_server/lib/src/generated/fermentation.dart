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

abstract class Fermentation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = FermentationTable();

  static const db = FermentationRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static FermentationInclude include() {
    return FermentationInclude._();
  }

  static FermentationIncludeList includeList({
    _i1.WhereExpressionBuilder<FermentationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FermentationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FermentationTable>? orderByList,
    FermentationInclude? include,
  }) {
    return FermentationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Fermentation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Fermentation.t),
      include: include,
    );
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

class FermentationUpdateTable extends _i1.UpdateTable<FermentationTable> {
  FermentationUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<int, int> harvestId(int? value) => _i1.ColumnValue(
    table.harvestId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> startedAt(DateTime value) =>
      _i1.ColumnValue(
        table.startedAt,
        value,
      );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> instructions(String? value) =>
      _i1.ColumnValue(
        table.instructions,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastTurnedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastTurnedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> nextTurnAt(DateTime? value) =>
      _i1.ColumnValue(
        table.nextTurnAt,
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

class FermentationTable extends _i1.Table<int?> {
  FermentationTable({super.tableRelation}) : super(tableName: 'fermentation') {
    updateTable = FermentationUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    harvestId = _i1.ColumnInt(
      'harvestId',
      this,
    );
    startedAt = _i1.ColumnDateTime(
      'startedAt',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    instructions = _i1.ColumnString(
      'instructions',
      this,
    );
    lastTurnedAt = _i1.ColumnDateTime(
      'lastTurnedAt',
      this,
    );
    nextTurnAt = _i1.ColumnDateTime(
      'nextTurnAt',
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

  late final FermentationUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnInt harvestId;

  late final _i1.ColumnDateTime startedAt;

  late final _i1.ColumnString status;

  late final _i1.ColumnString instructions;

  late final _i1.ColumnDateTime lastTurnedAt;

  late final _i1.ColumnDateTime nextTurnAt;

  late final _i1.ColumnString notes;

  late final _i1.ColumnInt userInfoId;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    harvestId,
    startedAt,
    status,
    instructions,
    lastTurnedAt,
    nextTurnAt,
    notes,
    userInfoId,
  ];
}

class FermentationInclude extends _i1.IncludeObject {
  FermentationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Fermentation.t;
}

class FermentationIncludeList extends _i1.IncludeList {
  FermentationIncludeList._({
    _i1.WhereExpressionBuilder<FermentationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Fermentation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Fermentation.t;
}

class FermentationRepository {
  const FermentationRepository._();

  /// Returns a list of [Fermentation]s matching the given query parameters.
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
  Future<List<Fermentation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FermentationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FermentationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FermentationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Fermentation>(
      where: where?.call(Fermentation.t),
      orderBy: orderBy?.call(Fermentation.t),
      orderByList: orderByList?.call(Fermentation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Fermentation] matching the given query parameters.
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
  Future<Fermentation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FermentationTable>? where,
    int? offset,
    _i1.OrderByBuilder<FermentationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FermentationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Fermentation>(
      where: where?.call(Fermentation.t),
      orderBy: orderBy?.call(Fermentation.t),
      orderByList: orderByList?.call(Fermentation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Fermentation] by its [id] or null if no such row exists.
  Future<Fermentation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Fermentation>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Fermentation]s in the list and returns the inserted rows.
  ///
  /// The returned [Fermentation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Fermentation>> insert(
    _i1.Session session,
    List<Fermentation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Fermentation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Fermentation] and returns the inserted row.
  ///
  /// The returned [Fermentation] will have its `id` field set.
  Future<Fermentation> insertRow(
    _i1.Session session,
    Fermentation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Fermentation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Fermentation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Fermentation>> update(
    _i1.Session session,
    List<Fermentation> rows, {
    _i1.ColumnSelections<FermentationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Fermentation>(
      rows,
      columns: columns?.call(Fermentation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Fermentation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Fermentation> updateRow(
    _i1.Session session,
    Fermentation row, {
    _i1.ColumnSelections<FermentationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Fermentation>(
      row,
      columns: columns?.call(Fermentation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Fermentation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Fermentation?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<FermentationUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Fermentation>(
      id,
      columnValues: columnValues(Fermentation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Fermentation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Fermentation>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<FermentationUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<FermentationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FermentationTable>? orderBy,
    _i1.OrderByListBuilder<FermentationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Fermentation>(
      columnValues: columnValues(Fermentation.t.updateTable),
      where: where(Fermentation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Fermentation.t),
      orderByList: orderByList?.call(Fermentation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Fermentation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Fermentation>> delete(
    _i1.Session session,
    List<Fermentation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Fermentation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Fermentation].
  Future<Fermentation> deleteRow(
    _i1.Session session,
    Fermentation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Fermentation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Fermentation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FermentationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Fermentation>(
      where: where(Fermentation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FermentationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Fermentation>(
      where: where?.call(Fermentation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
