// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:covid_tracker/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  test('check_statuscode_success', () async {
    var url = 'https://corona.lmao.ninja/v2/countries?yesterday&sort';
    var response = await http.get(url);
    expect(response.statusCode, 200);
  });

  test('parse_json_success', () async {
    var url = 'https://corona.lmao.ninja/v2/countries?yesterday&sort';
    var response = await http.get(url);
    var body = json.decode(response.body);
    List<Data> res = List<Data>.from(body.map((i) => Data.fromJson(i)));

    expect(res[0].country, "Afghanistan");
  });

  test('get_flag_success', () async {
    var url = 'https://corona.lmao.ninja/v2/countries?yesterday&sort';
    var response = await http.get(url);
    var body = json.decode(response.body);
    List<Data> res = List<Data>.from(body.map((i) => Data.fromJson(i)));
    var flag =
        "https://www.countryflags.io/${res[0].countryInfo.iso2}/shiny/64.png";
    expect(res[0].country, "Afghanistan");
  });
}
