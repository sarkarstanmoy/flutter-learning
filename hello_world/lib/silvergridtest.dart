import 'package:flutter/material.dart';

class SilverGridTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.transparent,
                expandedHeight: 400,
                flexibleSpace: FlexibleSpaceBar(
                  background: FittedBox(
                    child: Image.asset('images/minions.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.deepPurple[100 * (index % 9)],
                      height: 200,
                      child: Text('grid item $index'),
                    );
                  },
                  childCount: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
