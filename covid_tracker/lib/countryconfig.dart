import 'package:json_annotation/json_annotation.dart';
part 'countryconfig.g.dart';

@JsonSerializable(nullable: false)
class CountryConfig {
  final String iso2;
  final double lat;
  final double long;

  CountryConfig(this.iso2, this.lat, this.long);

  factory CountryConfig.fromJson(Map<String, dynamic> json) =>
      _$CountryConfigFromJson(json);
  Map<String, dynamic> toJson() => _$CountryConfigToJson(this);
}
