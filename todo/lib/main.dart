import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Services/todoService.dart';
import 'Screens/entry.dart';

void main() {
  runApp(
    MaterialApp(
      title: "TODO APP",
      color: Colors.teal,
      routes: {
        '/enter': (context) => TodoEntry(),
      },
      home: ChangeNotifierProvider(
        create: (context) => TodoService(),
        builder: (context, child) {
          return Main();
        },
        child: Main(),
      ),
    ),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TODO App",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          title: Text("TODO List"),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.teal,
            child: Consumer<TodoService>(builder: (_, _todoService, __) {
              return ListView.separated(
                itemCount: _todoService.todoList.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 10,
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text('yyy'),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, "/enter");
          },
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
