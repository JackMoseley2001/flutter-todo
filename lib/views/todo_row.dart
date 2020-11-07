import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/todo_state.dart';

import '../models/todo.dart';

class TodoRow extends StatelessWidget {
  final Todo value;
  TodoRow({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.all(10),
        bottom: false,
        child: Container(
            // padding: EdgeInsets.all(10),
            child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  if (value.description.isNotEmpty)
                    Text(
                      value.description,
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                ],
              ),
              flex: 9,
            ),
            Expanded(
              child: Checkbox(
                value: value.completed,
                onChanged: (state) =>
                    Provider.of<TodoState>(context, listen: false)
                        .toggleComplete(value),
              ),
              flex: 1,
            )
          ],
        )));
  }
}
