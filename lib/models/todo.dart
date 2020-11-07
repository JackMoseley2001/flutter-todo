import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class Todo {
  final String id = Uuid().v4();
  String title;
  String description;
  bool completed = false;

  Todo({@required this.title, this.description, this.completed});
}
