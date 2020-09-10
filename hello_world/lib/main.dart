import 'package:flutter/material.dart';

void main() {
  runApp(HelloWorld());
}

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: SafeArea(
        child: Center(
          child: Container(
            child: Text('HelloWorld'),
          ),
        ),
      ),
    );
  }
}
