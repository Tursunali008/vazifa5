import 'package:vazifa5/controllers/note_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteNotifier extends InheritedWidget {
  NoteController noteController = NoteController();

  NoteNotifier({
    super.key,
    required this.noteController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant NoteNotifier oldWidget) {
    return oldWidget.noteController != noteController;
  }

  static NoteController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NoteNotifier>()!
        .noteController;
  }
}
