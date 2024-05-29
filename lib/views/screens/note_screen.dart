import 'package:vazifa5/controllers/note_controller.dart';
import 'package:vazifa5/views/widgets/costom_driver.dart';
import 'package:vazifa5/views/widgets/note_widgets/note_add.dart';
import 'package:vazifa5/views/widgets/note_widgets/note_edit.dart';
import 'package:flutter/material.dart';
import 'package:vazifa5/views/widgets/note_widgets/note_item_edit.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    NoteController noteController = NoteController();
    return ListenableBuilder(
        listenable: noteController,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Note"),
            ),
            drawer: const CustomDrawer(),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: noteController.list.length,
                    itemBuilder: (context, index) {
                      return NoteItem(
                        title: noteController.list[index].title,
                        onDelete: () {
                          noteController.noteRemove(index);
                        },
                        onEdit: () async {
                          Map<String, dynamic>? data = await showDialog(
                              context: context,
                              builder: (ctx) {
                                return NoteEdit(
                                  noteController: noteController,
                                  index: index,
                                );
                              });
                          if (data != null) {
                            noteController.noteEdit(
                              index,
                              data["id"],
                              data["title"],
                              data["description"],
                            );
                            setState(() {}); // Ensure the screen updates
                          }
                        },
                        dateTime: noteController.list[index].createdDate,
                      );
                    },
                  ),
                )
              ],
            ),
            floatingActionButton: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return NoteAdd(noteController: noteController);
                    });
              },
              icon: const Icon(Icons.add, color: Colors.black),
            ),
          );
        });
  }
}
