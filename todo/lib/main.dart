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
          title: Text("TODO List"),
        ),
        body: SafeArea(
          child: Container(
            child: Consumer<TodoService>(builder: (_, _todoService, __) {
              return ListView.separated(
                itemCount: _todoService.todoList.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Delete"),
                            content: Text("Do you want to delete?"),
                            actions: [
                              okButton(context, todo, _todoService, index),
                              cancelButton(context),
                            ],
                          );
                        }),
                    child: Card(
                      elevation: 10,
                      color: Colors.orange.shade100,
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                  _todoService.todoList[index].values
                                      .toList()[1]
                                      .toString(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Text(_todoService.todoList[index].values
                                    .toList()[2]
                                    .toString()),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  FlatButton okButton(BuildContext context, TodoService todo,
      TodoService _todoService, int index) {
    return FlatButton(
      onPressed: () {
        todo.remove(_todoService.todoList[index].values.toList()[0].toString());
        Navigator.of(context).pop();
      },
      child: Text("Ok"),
    );
  }

  FlatButton cancelButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text("Cancel"),
    );
  }
}
