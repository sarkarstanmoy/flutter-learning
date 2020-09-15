import 'package:flutter/cupertino.dart';
import 'package:todo/Repository/todoRepository.dart';

class TodoService extends ChangeNotifier {
  List<Map<String, dynamic>> todoList = [];
  TodoService() {
    getAll();
  }
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

    getAll();
  }
}
