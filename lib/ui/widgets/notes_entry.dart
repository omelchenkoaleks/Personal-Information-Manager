import 'package:flutter/material.dart';
import 'package:notes/ui/widgets/notes.dart';

class NotesEntry extends StatelessWidget {
  const NotesEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Entry'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          notesModel
              .setStackIndex(0); // The screen with indexStack = 0 is rebuild.
        },
        child: const Text('back'),
      ),
    );
  }
}
