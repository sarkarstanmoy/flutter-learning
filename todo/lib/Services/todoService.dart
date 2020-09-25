import 'package:flutter/material.dart';
import 'package:todo/Repository/todoRepository.dart';

class TodoService extends ChangeNotifier {
  TodoService() {
    getAll();
  }
  List<Map<String, dynamic>> todoList = [];
  getAll() async {
    todoList = await TodoRepository.instance.getAll();
    notifyListeners();
  }

  addTodo(String task, String selectedDate) async {
    await TodoRepository.instance.insert(
      {
        TodoRepository.instance.textColumn: task,
        TodoRepository.instance.dateColumn: selectedDate
      },
    );
    getAll();
  }

  remove(String id) async {
    await TodoRepository.instance.delete(id);
    getAll();
  }
}
