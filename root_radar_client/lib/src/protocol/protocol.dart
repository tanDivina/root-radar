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
import 'butler_message.dart' as _i2;
import 'cacao_batch.dart' as _i3;
import 'fermentation.dart' as _i4;
import 'greetings/greeting.dart' as _i5;
import 'harvest.dart' as _i6;
import 'maintenance_log.dart' as _i7;
import 'plant_photo.dart' as _i8;
import 'plants/plant.dart' as _i9;
import 'weather_data.dart' as _i10;
import 'package:root_radar_client/src/protocol/butler_message.dart' as _i11;
import 'package:root_radar_client/src/protocol/plants/plant.dart' as _i12;
import 'package:root_radar_client/src/protocol/plant_photo.dart' as _i13;
import 'package:root_radar_client/src/protocol/maintenance_log.dart' as _i14;
import 'package:root_radar_client/src/protocol/fermentation.dart' as _i15;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i16;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i17;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i18;
export 'butler_message.dart';
export 'cacao_batch.dart';
export 'fermentation.dart';
export 'greetings/greeting.dart';
export 'harvest.dart';
export 'maintenance_log.dart';
export 'plant_photo.dart';
export 'plants/plant.dart';
export 'weather_data.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.ButlerMessage) {
      return _i2.ButlerMessage.fromJson(data) as T;
    }
    if (t == _i3.CacaoBatch) {
      return _i3.CacaoBatch.fromJson(data) as T;
    }
    if (t == _i4.Fermentation) {
      return _i4.Fermentation.fromJson(data) as T;
    }
    if (t == _i5.Greeting) {
      return _i5.Greeting.fromJson(data) as T;
    }
    if (t == _i6.Harvest) {
      return _i6.Harvest.fromJson(data) as T;
    }
    if (t == _i7.MaintenanceLog) {
      return _i7.MaintenanceLog.fromJson(data) as T;
    }
    if (t == _i8.PlantPhoto) {
      return _i8.PlantPhoto.fromJson(data) as T;
    }
    if (t == _i9.Plant) {
      return _i9.Plant.fromJson(data) as T;
    }
    if (t == _i10.WeatherData) {
      return _i10.WeatherData.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ButlerMessage?>()) {
      return (data != null ? _i2.ButlerMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CacaoBatch?>()) {
      return (data != null ? _i3.CacaoBatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Fermentation?>()) {
      return (data != null ? _i4.Fermentation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Greeting?>()) {
      return (data != null ? _i5.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Harvest?>()) {
      return (data != null ? _i6.Harvest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.MaintenanceLog?>()) {
      return (data != null ? _i7.MaintenanceLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PlantPhoto?>()) {
      return (data != null ? _i8.PlantPhoto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Plant?>()) {
      return (data != null ? _i9.Plant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.WeatherData?>()) {
      return (data != null ? _i10.WeatherData.fromJson(data) : null) as T;
    }
    if (t == List<_i11.ButlerMessage>) {
      return (data as List)
              .map((e) => deserialize<_i11.ButlerMessage>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i12.Plant>) {
      return (data as List).map((e) => deserialize<_i12.Plant>(e)).toList()
          as T;
    }
    if (t == List<_i13.PlantPhoto>) {
      return (data as List).map((e) => deserialize<_i13.PlantPhoto>(e)).toList()
          as T;
    }
    if (t == List<_i14.MaintenanceLog>) {
      return (data as List)
              .map((e) => deserialize<_i14.MaintenanceLog>(e))
              .toList()
          as T;
    }
    if (t == List<_i15.Fermentation>) {
      return (data as List)
              .map((e) => deserialize<_i15.Fermentation>(e))
              .toList()
          as T;
    }
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i17.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i18.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.ButlerMessage => 'ButlerMessage',
      _i3.CacaoBatch => 'CacaoBatch',
      _i4.Fermentation => 'Fermentation',
      _i5.Greeting => 'Greeting',
      _i6.Harvest => 'Harvest',
      _i7.MaintenanceLog => 'MaintenanceLog',
      _i8.PlantPhoto => 'PlantPhoto',
      _i9.Plant => 'Plant',
      _i10.WeatherData => 'WeatherData',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('root_radar.', '');
    }

    switch (data) {
      case _i2.ButlerMessage():
        return 'ButlerMessage';
      case _i3.CacaoBatch():
        return 'CacaoBatch';
      case _i4.Fermentation():
        return 'Fermentation';
      case _i5.Greeting():
        return 'Greeting';
      case _i6.Harvest():
        return 'Harvest';
      case _i7.MaintenanceLog():
        return 'MaintenanceLog';
      case _i8.PlantPhoto():
        return 'PlantPhoto';
      case _i9.Plant():
        return 'Plant';
      case _i10.WeatherData():
        return 'WeatherData';
    }
    className = _i16.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i17.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i18.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ButlerMessage') {
      return deserialize<_i2.ButlerMessage>(data['data']);
    }
    if (dataClassName == 'CacaoBatch') {
      return deserialize<_i3.CacaoBatch>(data['data']);
    }
    if (dataClassName == 'Fermentation') {
      return deserialize<_i4.Fermentation>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i5.Greeting>(data['data']);
    }
    if (dataClassName == 'Harvest') {
      return deserialize<_i6.Harvest>(data['data']);
    }
    if (dataClassName == 'MaintenanceLog') {
      return deserialize<_i7.MaintenanceLog>(data['data']);
    }
    if (dataClassName == 'PlantPhoto') {
      return deserialize<_i8.PlantPhoto>(data['data']);
    }
    if (dataClassName == 'Plant') {
      return deserialize<_i9.Plant>(data['data']);
    }
    if (dataClassName == 'WeatherData') {
      return deserialize<_i10.WeatherData>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i16.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i17.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i18.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i16.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i17.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i18.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
