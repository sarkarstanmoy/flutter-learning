// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:covid_tracker/data.dart';
import 'dart:convert';

import 'package:covid_tracker/main.dart';

void main() {
  testWidgets('onclicking_tile_should_expand', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    tester.tap(find.byType(ExpansionTile).first);
  });

  testWidgets('parse_json', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    String jsonData =
        '[  {    \"updated\": 1587140875524,    \"country\": \"Afghanistan\",    \"countryInfo\": {      \"_id\": 4,      \"iso2\": \"AF\",      \"iso3\": \"AFG\",      \"lat\": 33,      \"long\": 65,      \"flag\": \"https:\/\/raw.githubusercontent.com\/NovelCOVID\/API\/master\/assets\/flags\/af.png\"    },    \"cases\": 840,    \"todayCases\": 56,    \"deaths\": 30,    \"todayDeaths\": 5,    \"recovered\": 54,    \"active\": 756,    \"critical\": 0,    \"casesPerOneMillion\": 22,    \"deathsPerOneMillion\": 0,    \"tests\": 0,    \"testsPerOneMillion\": 0  }]';
    final str = json.decode(jsonData);
    final data = Data.fromJson(str[0] as Map<String, dynamic>);

    expect(data.country, "Afghanistan");
  });
}
