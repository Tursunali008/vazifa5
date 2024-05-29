import 'package:vazifa5/models/todo_model.dart';
import 'package:flutter/material.dart';

class ToDoController with ChangeNotifier {
  final List<ToDo> _list = [
    ToDo(
        id: "1",
        title: "kino korish",
        description: "popkorin olib ol",
        dates: DateTime.now(),
        isDone: true),
    ToDo(
        id: "2",
        title: "Vazifa",
        description: "vazifani qilish zarur",
        dates: DateTime.now(),
        isDone: false),
    ToDo(
        id: "3",
        title: "Dars",
        description: "Darsga borish",
        dates: DateTime.now(),
        isDone: true),
  ];

  List<ToDo> get list {
    return [..._list];
  }

  void todoAdd(String id, String title, String description, DateTime dates) {
    _list.add(
        ToDo(id: id, title: title, description: description, dates: dates));
    notifyListeners();
  }

  void todoRemove(int index) {
    _list.removeAt(index);
    notifyListeners();
  }

  void todoEdit(
      int index, String newTitle, String newDescription, DateTime newDates) {
    _list[index].title = newTitle;
    _list[index].description = newDescription;
    _list[index].dates = newDates;
    notifyListeners();
  }
}
