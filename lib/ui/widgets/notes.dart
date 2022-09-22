import 'package:flutter/material.dart';
import 'package:notes/ui/widgets/notes_entry.dart';
import 'package:notes/ui/widgets/notes_list.dart';
import 'package:notes/ui/widgets/notes_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../db_sqflite/notes_db.dart';

class Notes extends StatelessWidget {
  Notes({super.key}) {
    notesModel.loadData(NotesDBService.dbService);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NotesModel>(
      model: notesModel,
      child: ScopedModelDescendant<NotesModel>(
        builder: (context, child, model) {
          return IndexedStack(
            index: model.stackIndex,
            children: [
              const NotesList(),
              NotesEntry(),
            ],
          );
        },
      ),
    );
  }
}
