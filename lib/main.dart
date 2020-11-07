import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'todo_form.dart';

import 'models/todo.dart';
import 'views/todo_row.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  Widget _buildListItem(Todo todo, int index) {
    return Slidable(
      controller: slidableController,
      key: Key(todo.id),
      actionPane: SlidableScrollActionPane(),
      child: TodoRow(value: todo),
      secondaryActions: [
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _deleteTodo(index))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: _todos.length,
        itemBuilder: (BuildContext context, int index) {
          var currentItem = _todos[index];
          return _buildListItem(currentItem, index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
