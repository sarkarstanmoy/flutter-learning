import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Services/todoService.dart';

class TodoEntry extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final entryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var entry = Provider.of<TodoService>(context, listen: false);
    DateTime picked = DateTime.now();
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
                onPressed: () async {
                  picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                  );
                },
                child: Text("Select Date"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Selected Date"),
                  Text("${picked.day}-${picked.month}-${picked.year}")
                ],
              ),
              RaisedButton(
                child: Text("Done"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    entry.addTodo(entryController.text,
                        "${picked.day}-${picked.month}-${picked.year}");
                    Navigator.pop(context, true);
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
