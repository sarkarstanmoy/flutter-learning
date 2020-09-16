import 'package:flutter/material.dart';
import 'package:todo/Repository/todoRepository.dart';

class TodoService extends ChangeNotifier {
  // TodoService() {
  //   getAll();
  // }
  List<Map<String, dynamic>> todoList = [];
  getAll() async {
    todoList = await TodoRepository.instance.getAll();
    notifyListeners();
  }

  addTodo(String task) async {
    await TodoRepository.instance.insert(
      {
        TodoRepository.instance.textColumn: task,
        TodoRepository.instance.dateColumn: DateTime.now().toString()
      },
    );
    todoList.add({'test': DateTime.now().toIso8601String()});
    notifyListeners();
  }
}
