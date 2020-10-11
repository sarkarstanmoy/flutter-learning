import 'data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryRepository {
  Future<List<Data>> get getCovidData async {
    var url = 'https://corona.lmao.ninja/v2/countries?yesterday&sort';
    var response = await http.get(url);
    var body = json.decode(response.body);
    return List<Data>.from(body.map((i) => Data.fromJson(i)));
  }
}
