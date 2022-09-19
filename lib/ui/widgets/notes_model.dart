import 'package:scoped_model/scoped_model.dart';

class Note {
  // int id;
  String title;
  String content;
  Note({
    required this.title,
    required this.content,
  });
  // String color;

  @override
  String toString() => 'Note(title: $title, content: $content)';
}

class NotesModel extends Model {
  int stackIndex = 0;
  List entityList = [];

  void loadData(Note note) {
    entityList.add(note);

    notifyListeners();
  }

  void setStackIndex(int inStackIndex) {
    stackIndex = inStackIndex;

    notifyListeners();
  }
}
