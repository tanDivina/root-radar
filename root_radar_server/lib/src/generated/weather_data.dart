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

abstract class WeatherData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  WeatherData._({
    required this.temperature,
    required this.condition,
    required this.isHeatwave,
    this.humidity,
    this.precipitationRisk,
  });

  factory WeatherData({
    required double temperature,
    required String condition,
    required bool isHeatwave,
    int? humidity,
    double? precipitationRisk,
  }) = _WeatherDataImpl;

  factory WeatherData.fromJson(Map<String, dynamic> jsonSerialization) {
    return WeatherData(
      temperature: (jsonSerialization['temperature'] as num).toDouble(),
      condition: jsonSerialization['condition'] as String,
      isHeatwave: jsonSerialization['isHeatwave'] as bool,
      humidity: jsonSerialization['humidity'] as int?,
      precipitationRisk: (jsonSerialization['precipitationRisk'] as num?)
          ?.toDouble(),
    );
  }

  double temperature;

  String condition;

  bool isHeatwave;

  int? humidity;

  double? precipitationRisk;

  /// Returns a shallow copy of this [WeatherData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WeatherData copyWith({
    double? temperature,
    String? condition,
    bool? isHeatwave,
    int? humidity,
    double? precipitationRisk,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WeatherData',
      'temperature': temperature,
      'condition': condition,
      'isHeatwave': isHeatwave,
      if (humidity != null) 'humidity': humidity,
      if (precipitationRisk != null) 'precipitationRisk': precipitationRisk,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WeatherData',
      'temperature': temperature,
      'condition': condition,
      'isHeatwave': isHeatwave,
      if (humidity != null) 'humidity': humidity,
      if (precipitationRisk != null) 'precipitationRisk': precipitationRisk,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WeatherDataImpl extends WeatherData {
  _WeatherDataImpl({
    required double temperature,
    required String condition,
    required bool isHeatwave,
    int? humidity,
    double? precipitationRisk,
  }) : super._(
         temperature: temperature,
         condition: condition,
         isHeatwave: isHeatwave,
         humidity: humidity,
         precipitationRisk: precipitationRisk,
       );

  /// Returns a shallow copy of this [WeatherData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WeatherData copyWith({
    double? temperature,
    String? condition,
    bool? isHeatwave,
    Object? humidity = _Undefined,
    Object? precipitationRisk = _Undefined,
  }) {
    return WeatherData(
      temperature: temperature ?? this.temperature,
      condition: condition ?? this.condition,
      isHeatwave: isHeatwave ?? this.isHeatwave,
      humidity: humidity is int? ? humidity : this.humidity,
      precipitationRisk: precipitationRisk is double?
          ? precipitationRisk
          : this.precipitationRisk,
    );
  }
}
