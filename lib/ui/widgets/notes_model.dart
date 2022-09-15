import 'package:scoped_model/scoped_model.dart';

class NotesModel extends Model {
  int stackIndex = 0;

  void setStackIndex(int inStackIndex) {
    stackIndex = inStackIndex;

    // When the indexedStack changes, the screen
    // is rebuilt based on the value of the stack index.
    notifyListeners();
  }
}
