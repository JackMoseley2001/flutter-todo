import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'todo_form.dart';

import 'models/todo.dart';
import 'package:todolist/views/todo_list.dart';

class NotCompletedTodoList extends StatefulWidget {
  NotCompletedTodoList({Key key}) : super(key: key);

  @override
  _NotCompletedTodoListState createState() => _NotCompletedTodoListState();
}

class _NotCompletedTodoListState extends State<NotCompletedTodoList> {
  List<Todo> _todos = [];

  final SlidableController slidableController = SlidableController();

  void _addTodo() async {
    Todo newTodo = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoForm()));
    if (newTodo != null) {
      setState(() {
        _todos.add(newTodo);
      });
    }
  }

  void _deleteTodo(Todo item) {
    int indexOfTodo = _todos.indexOf(item);
    if (indexOfTodo != null) {
      setState(() {
        _todos.removeAt(indexOfTodo);
      });
    }
  }

  void _changeCompleted(Todo item, bool state) {
    int indexOfTodo = _todos.indexOf(item);
    if (indexOfTodo != null) {
      setState(() {
        _todos[indexOfTodo].completed = state;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoList(
        todos: _todos,
        deleteItem: _deleteTodo,
        changeCompleted: _changeCompleted,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
