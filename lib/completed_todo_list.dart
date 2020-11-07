import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/todo_state.dart';
import 'package:todolist/views/todo_list.dart';

class CompletedTodoList extends StatefulWidget {
  CompletedTodoList({Key key}) : super(key: key);

  @override
  _CompletedTodoListState createState() => _CompletedTodoListState();
}

class _CompletedTodoListState extends State<CompletedTodoList> {
  final SlidableController slidableController = SlidableController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoState>(builder: (context, todos, child) {
      return TodoList(todos: todos.completedTodos);
    });
  }
}
