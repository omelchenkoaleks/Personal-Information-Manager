import 'package:flutter/material.dart';
import 'package:notes/ui/widgets/notes_entry.dart';
import 'package:notes/ui/widgets/notes_list.dart';
import 'package:notes/ui/widgets/notes_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NotesModel>(
      model: notesModel,
      child: ScopedModelDescendant<NotesModel>(
        builder: (context, child, model) {
          return IndexedStack(
            index: model.stackIndex,
            children: const [
              NotesList(), // indexStack = 0 default
              NotesEntry(), // indexStack = 1
            ],
          );
        },
      ),
    );
  }
}

// The one and only instance of this model.
NotesModel notesModel = NotesModel();
