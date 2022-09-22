import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'notes_model.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: notesModel,
      child: ScopedModelDescendant<NotesModel>(
        builder: (context, child, model) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Notes'),
            ),
            body: ListView.builder(
                itemCount: notesModel.entityList.length,
                itemBuilder: (context, int index) {
                  Note note = notesModel.entityList[index];
                  return Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Card(
                      elevation: 8,
                      child: ListTile(
                        title: Text(note.title),
                        subtitle: Text(note.content),
                        // Edit existing note.
                        onTap: (() {}),
                      ),
                    ),
                  );
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                notesModel.setStackIndex(1);
              },
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
