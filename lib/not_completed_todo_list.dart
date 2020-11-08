import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todolist/todo_form.dart';

import 'package:todolist/models/todo_state.dart';
import 'package:todolist/views/todo_list.dart';

class NotCompletedTodoList extends StatefulWidget {
  NotCompletedTodoList({Key key}) : super(key: key);

  @override
  _NotCompletedTodoListState createState() => _NotCompletedTodoListState();
}

class _NotCompletedTodoListState extends State<NotCompletedTodoList> {
  void _addTodo() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoForm()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoState>(builder: (context, todoState, child) {
      return Scaffold(
        body: TodoList(
          todos: todoState.notCompletedTodos,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addTodo,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
