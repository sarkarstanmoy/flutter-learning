import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Services/todoService.dart';
import 'Screens/entry.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoService(),
      child: MaterialApp(
        home: Main(),
      ),
    ),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var todo = Provider.of<TodoService>(context, listen: false);

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
                  return GestureDetector(
                    onTap: () => todo.remove(
                      _todoService.todoList[index].values
                          .toList()[0]
                          .toString(),
                    ),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            _todoService.todoList[index].values
                                .toList()[1]
                                .toString(),
                          ),
                        ),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoEntry(),
              ),
            );
          },
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
