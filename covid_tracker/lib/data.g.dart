// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    country: json['country'] as String,
    testsPerOneMillion: json['testsPerOneMillion'] as int,
    cases: json['cases'] as int,
    todayCases: json['todayCases'] as int,
    totalDeaths: json['totalDeaths'] as int,
    recovered: json['recovered'] as int,
    active: json['active'] as int,
    critical: json['critical'] as int,
    deaths: json['deaths'] as int,
    countryInfo:
        CountryConfig.fromJson(json['countryInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'country': instance.country,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'totalDeaths': instance.totalDeaths,
      'recovered': instance.recovered,
      'active': instance.active,
      'critical': instance.critical,
      'testsPerOneMillion': instance.testsPerOneMillion,
      'countryInfo': instance.countryInfo,
    };
