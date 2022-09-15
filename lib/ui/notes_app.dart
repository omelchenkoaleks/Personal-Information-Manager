import 'package:flutter/material.dart';
import 'package:notes/ui/widgets/notes.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Notes(),
    );
  }
}
