import 'package:meta/meta.dart';

class Todo {
  String title;
  String description;
  bool completed = false;

  Todo({@required this.title, this.description, this.completed});
}
