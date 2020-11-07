import 'package:flutter/material.dart';
import 'models/todo.dart';

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
