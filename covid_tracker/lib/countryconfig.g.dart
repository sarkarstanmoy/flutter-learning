// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countryconfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryConfig _$CountryConfigFromJson(Map<String, dynamic> json) {
  return CountryConfig(
    json['iso2'] as String,
    (json['lat'] as num).toDouble(),
    (json['long'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CountryConfigToJson(CountryConfig instance) =>
    <String, dynamic>{
      'iso2': instance.iso2,
      'lat': instance.lat,
      'long': instance.long,
    };
