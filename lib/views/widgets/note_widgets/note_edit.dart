import 'package:vazifa5/controllers/note_controller.dart';
import 'package:flutter/material.dart';

class NoteEdit extends StatefulWidget {
  final int index;
  final NoteController noteController;

  const NoteEdit({
    super.key,
    required this.noteController,
    required this.index,
  });

  @override
  State<NoteEdit> createState() => _NoteEditDialogState();
}

class _NoteEditDialogState extends State<NoteEdit> {
  late final TextEditingController idController;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController dateController;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final noteItem = widget.noteController.list[widget.index];
    idController = TextEditingController(text: noteItem.id);
    titleController = TextEditingController(text: noteItem.title);
    descriptionController = TextEditingController(text: noteItem.content);
    dateController =
        TextEditingController(text: noteItem.createdDate.toIso8601String());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Edit Note"),
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: idController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("ID"),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Input ID";
                }
                return null;
              },
            ),
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Input Title";
                }
                return null;
              },
            ),
            TextFormField(
              controller: descriptionController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("Description"),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Enter Description";
                }
                return null;
              },
            ),
            TextFormField(
              controller: dateController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("Date"),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Enter Date";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                if (selectedDate != null) {
                  dateController.text = selectedDate.toIso8601String();
                }
              },
              child: const Text(
                'Chouse date',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formkey.currentState!.validate()) {
              widget.noteController.noteEdit(
                widget.index,
                idController.text,
                titleController.text,
                DateTime.parse(
                    dateController.text), 
              );
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
