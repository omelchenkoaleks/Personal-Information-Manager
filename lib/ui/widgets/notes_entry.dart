import 'package:flutter/material.dart';
import 'package:notes/ui/widgets/notes.dart';
import 'package:notes/ui/widgets/notes_model.dart';
import 'package:scoped_model/scoped_model.dart';

class NotesEntry extends StatelessWidget {
  NotesEntry({super.key});

  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: notesModel,
      child: ScopedModelDescendant<NotesModel>(
        builder: (context, child, model) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Entry'),
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                children: [
                  // ---------------------------------------------------- Title note:
                  ListTile(
                    leading: const Icon(Icons.title),
                    title: TextFormField(
                      decoration: const InputDecoration(hintText: "Title"),
                      controller: _titleEditingController,
                      validator: ((value) {
                        value ?? 'Please enter a Title!';
                      }),
                    ),
                  ),
                  // -------------------------------------------------- Content note:
                  ListTile(
                    leading: const Icon(Icons.content_paste),
                    title: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      decoration: const InputDecoration(hintText: "Content"),
                      controller: _contentEditingController,
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  ElevatedButton(child: const Text("Cancel"), onPressed: () {}),
                  const Spacer(),
                  ElevatedButton(
                    child: const Text("Save"),
                    onPressed: () {
                      final title = _titleEditingController.text;
                      final content = _contentEditingController.text;
                      final note = Note(title: title, content: content);
                      notesModel.loadData(note);

                      notesModel.setStackIndex(
                          0); // The screen with indexStack = 0 is rebuild.
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
