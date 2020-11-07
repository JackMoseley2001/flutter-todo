import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

class TodoForm extends StatefulWidget {
  TodoForm({Key key}) : super(key: key);

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  Todo _formValue = Todo(title: '');

  InputDecoration _getInputDecoration(String title) {
    return InputDecoration(
        labelText: title,
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[200]);
  }

  String _validateTitle(String value) {
    if (value.isEmpty) return 'Title cannot be blank';
    return null;
  }

  void _saveForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.pop(context, _formValue);
    }
  }

  void _saveTitle(String value) {
    setState(() => {_formValue.title = value});
  }

  void _saveDescription(String value) {
    setState(() => {_formValue.description = value});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add New Todo')),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: _getInputDecoration('Title'),
                    onSaved: _saveTitle,
                    validator: _validateTitle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: _getInputDecoration('Description'),
                    onSaved: _saveDescription,
                    maxLines: null,
                  ),
                ),
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: _saveForm,
                )
              ]),
            ))));
  }
}
