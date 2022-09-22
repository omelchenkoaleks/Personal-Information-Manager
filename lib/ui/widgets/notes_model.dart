import 'package:notes/db_sqflite/notes_db.dart';
import 'package:scoped_model/scoped_model.dart';

class Note {
  int id = 0;
  String title = '';
  String content = '';
}

class NotesModel extends Model {
  int stackIndex = 0;
  List entityList = [];

  void loadData(NotesDBService db) async {
    entityList = await db.getAll();

    notifyListeners();
  }

  void setStackIndex(int inStackIndex) {
    stackIndex = inStackIndex;

    notifyListeners();
  }
}

// The one and only instance of this model.
NotesModel notesModel = NotesModel();
