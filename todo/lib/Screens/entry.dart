import 'package:flutter/material.dart';
import 'package:todo/Services/todoService.dart';

class TodoEntry extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final entryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ENTER TODO"),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter your task"),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 8, 40, 8),
                child: TextFormField(
                  controller: entryController,
                  decoration:
                      const InputDecoration(hintText: "Enter your task"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter text";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              RaisedButton(
                child: Text("Done"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    TodoService todoService = TodoService();
                    todoService.addTodo(entryController.text);
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}