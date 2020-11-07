import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/views/todo_row.dart';

class TodoList extends StatelessWidget {
  TodoList(
      {Key key,
      @required this.todos,
      @required this.deleteItem,
      @required this.changeCompleted})
      : super(key: key);
  final List<Todo> todos;
  final Function deleteItem;
  final Function changeCompleted;

  final SlidableController _slidableController = SlidableController();

  Widget _buildListItem(Todo todo) {
    return Slidable(
      controller: _slidableController,
      key: Key(todo.id),
      actionPane: SlidableScrollActionPane(),
      child: TodoRow(
        value: todo,
        changeCompleted: changeCompleted,
      ),
      secondaryActions: [
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => deleteItem(todo))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          var currentItem = todos[index];
          return _buildListItem(currentItem);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
