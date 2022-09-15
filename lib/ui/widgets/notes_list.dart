import 'package:flutter/material.dart';
import 'package:notes/ui/widgets/notes.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notes'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, int index) {
            return Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Card(
                elevation: 8,
                child: ListTile(
                  title: const Text('note title'),
                  subtitle: const Text('note subtitle'),
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
  }
}
