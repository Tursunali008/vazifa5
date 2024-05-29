import 'package:vazifa5/controllers/todo_controllers.dart';
import 'package:flutter/material.dart';

class TodoNotifier extends InheritedWidget {
  final ToDoController toDoController;

  const TodoNotifier({
    super.key,
    required super.child,
    required this.toDoController,
  });

  @override
  bool updateShouldNotify(covariant TodoNotifier oldWidget) {
    return oldWidget.toDoController != toDoController;
  }

  static ToDoController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TodoNotifier>()!
        .toDoController;
  }
}
