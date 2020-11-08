import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/completed_todo_list.dart';
import 'package:todolist/models/todo_state.dart';
import 'package:todolist/not_completed_todo_list.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoState(),
    child: MyApp(),
  ));
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
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Not Completed',
                  ),
                  Tab(
                    text: 'Completed',
                  )
                ],
              ),
              title: Text('Todos'),
            ),
            body: TabBarView(
              children: [NotCompletedTodoList(), CompletedTodoList()],
            ),
          )),
    );
  }
}
