import 'package:flutter/material.dart';
import 'package:hello_world/random_words.dart';
import 'package:hello_world/silvergridtest.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<RandomWords>(
    create: (context) => RandomWords(),
    child: MaterialApp(
      home: HelloWorld(),
    ),
  ));
}

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final randomwords = Provider.of<RandomWords>(context, listen: false);
    return MaterialApp(
      title: 'Hello World',
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            RaisedButton(
              child: Text("Silver Grid"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SilverGridTest(),
                  ),
                );
              },
            ),
            Consumer<RandomWords>(
              builder: (context, value, child) => Center(
                child: Text(value.word),
              ),
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {randomwords.getWords()},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
