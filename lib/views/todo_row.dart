import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoRow extends StatelessWidget {
  final Todo value;
  TodoRow({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
    );
  }
}
