import 'package:covid_tracker/countryconfig.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable(nullable: false)
class Data {
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int totalDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int testsPerOneMillion;
  final CountryConfig countryInfo;

  Data(
      {this.country,
      this.testsPerOneMillion,
      this.cases,
      this.todayCases,
      this.totalDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.deaths,
      this.countryInfo});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

final covidrecords = [
  new Data(
      country: "Afghanistan",
      cases: 840,
      todayCases: 56,
      deaths: 30,
      totalDeaths: 5,
      recovered: 54,
      active: 756,
      critical: 0,
      testsPerOneMillion: 0)
  // new CovidData(
  //     country: "Albania",
  //     cases: "518",
  //     todayCases: "24",
  //     deaths: "26",
  //     totalDeaths: "1",
  //     recovered: "277",
  //     active: "215",
  //     critical: "5",
  //     testsPerOneMillion: "1677"),
  // new CovidData(
  //     country: "Algeria",
  //     cases: "2268",
  //     todayCases: "108",
  //     deaths: "348",
  //     totalDeaths: "12",
  //     recovered: "783",
  //     active: "1137",
  //     critical: "60",
  //     testsPerOneMillion: "77"),
  // new CovidData(
  //     country: "Andorra",
  //     cases: "673",
  //     todayCases: "0",
  //     deaths: "33",
  //     totalDeaths: "0",
  //     recovered: "169",
  //     active: "471",
  //     critical: "17",
  //     testsPerOneMillion: "21653"),
  // new CovidData(
  //     country: "Angola",
  //     cases: "19",
  //     todayCases: "0",
  //     deaths: "2",
  //     totalDeaths: "0",
  //     recovered: "5",
  //     active: "12",
  //     critical: "0",
  //     testsPerOneMillion: "0"),
  // new CovidData(
  //     country: "Anguilla",
  //     cases: "3",
  //     todayCases: "0",
  //     deaths: "0",
  //     totalDeaths: "0",
  //     recovered: "1",
  //     active: "2",
  //     critical: "0",
  //     testsPerOneMillion: "0"),
  // new CovidData(
  //     country: "Angola",
  //     cases: "19",
  //     todayCases: "0",
  //     deaths: "2",
  //     totalDeaths: "0",
  //     recovered: "5",
  //     active: "12",
  //     critical: "0",
  //     testsPerOneMillion: "0"),
  // new CovidData(
  //     country: "Antigua and Barbuda",
  //     cases: "23",
  //     todayCases: "0",
  //     deaths: "3",
  //     totalDeaths: "1",
  //     recovered: "3",
  //     active: "17",
  //     critical: "1",
  //     testsPerOneMillion: "745")
];

parseJson() {}
