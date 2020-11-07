import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';

class TodoState extends ChangeNotifier {
  final List<Todo> _todos = [];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);
  UnmodifiableListView<Todo> get notCompletedTodos {
    return UnmodifiableListView(_todos.where((el) => el.completed == false));
  }

  UnmodifiableListView<Todo> get completedTodos {
    return UnmodifiableListView(_todos.where((el) => el.completed == true));
  }

  void addTodo(Todo item) {
    _todos.add(item);
    notifyListeners();
  }

  void removeTodo(Todo item) {
    int index = _todos.indexOf(item);
    if (index != null) {
      _todos.removeAt(index);
      notifyListeners();
    }
  }

  void toggleComplete(Todo item) {
    int index = _todos.indexOf(item);
    if (index != null) {
      _todos[index].completed = !item.completed;
      notifyListeners();
    }
  }
}
