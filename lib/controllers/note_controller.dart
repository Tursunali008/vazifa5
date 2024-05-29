import 'package:vazifa5/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteController with ChangeNotifier {
  final List<NoteModel> _list = [
    NoteModel(
      id: "1",
      title: "Eslatma1",
      content: "Contents1",
      createdDate: DateTime.now(),
    ),
    NoteModel(
      id: "2",
      title: "Eslatma2",
      content: "Contents2",
      createdDate: DateTime.now(),
    ),
  ];

  List<NoteModel> get list {
    return [..._list];
  }

  void noteAdd(String id, String title, String content, DateTime newDateTime) {
    list.add(
      NoteModel(
        id: id,
        title: title,
        content: content,
        createdDate: newDateTime,
      ),
    );
    notifyListeners();
  }

  void noteEdit(
      int index, String newTitle, String newContent, DateTime newCreatedDate) {
    _list[index].title = newTitle;
    _list[index].content = newContent;
    _list[index].createdDate = DateTime.now();
    notifyListeners();
  }

  void noteRemove(int index) {
    _list.removeAt(index);
    notifyListeners();
  }
}
