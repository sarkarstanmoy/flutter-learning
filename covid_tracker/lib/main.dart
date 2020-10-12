import 'package:covid_tracker/data.dart';
import 'package:covid_tracker/repository.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    FutureProvider<List<Data>>(
      create: (context) => CountryRepository().getCovidData,
      //initialData: covidrecords,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Tracker',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var futureProvider = Provider.of<List<Data>>(context);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 2));
          return;
        },
        child: futureProvider == null
            ? Container(child: Center(child: CircularProgressIndicator()))
            : CustomScrollView(slivers: <Widget>[
                SliverAppBar(
                  title: Text("Covid Tracker"),
                  floating: true,
                  flexibleSpace: SizedBox.expand(
                    child: Image.asset(
                      'images/COVID.jpg',
                      width: 300,
                      height: 200,
                    ),
                  ),
                  expandedHeight: 150,
                  backgroundColor: Colors.teal.shade100,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      // return Consumer(builder: (context, List<Data> d, child) {
                      return _buildItem(futureProvider[index]);
                      //})
                    },
                  ),
                  // delegate: SliverChildBuilderDelegate((context, index) {

                  //   return _buildItem(covidrecords[index]);
                  // }, childCount: covidrecords.length),
                )
              ]),
      ),
    );
  }

  void showMessage(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Refreshed"),
      ),
    );
  }

  Widget _buildItem(Data e) {
    return Card(
      child: ExpansionTile(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [Text("Deaths"), Text(e.deaths.toString())],
              ),
              Text(e.cases.toString())
            ],
          )
        ],
        title: Row(
          children: [
            if (e.countryInfo != null)
              Image.network(
                  "https://www.countryflags.io/${e.countryInfo.iso2}/shiny/64.png"),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(e.country)),
          ],
        ),
        subtitle: Row(
          children: [
            Text("Active"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(e.active.toString()),
            )
          ],
        ),
      ),
    );
  }
}
