import 'package:notes/ui/widgets/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDBService {
  NotesDBService._();
  static final NotesDBService dbService = NotesDBService._();

  // The only one database instance.
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB.
    _database = await _initDB();
    return _database!;
  }

  // Return a Database instance.
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'notes.db');

    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE IF NOT EXISTS notes ("
            "id INTEGER PRIMARY KEY,"
            "title TEXT,"
            "content TEXT"
            ")");
      },
    );

    return db;
  }

  // Create a Note from a Map.
  Note noteFromMap(Map inMap) {
    Note note = Note();
    note.id = inMap['id'];
    note.title = inMap['title'];
    note.content = inMap['content'];

    return note;
  }

  // Create a Map from a Note.
  Map<String, dynamic> noteToMap(Note inNote) {
    Map<String, dynamic> map = <String, dynamic>{};
    map["id"] = inNote.id;
    map["title"] = inNote.title;
    map["content"] = inNote.content;

    return map;
  }

  Future create(Note inNote) async {
    Database db = await database;

    // Get largest current id in the table, plus one, to be the new ID.
    var getNewIdForNewNote =
        await db.rawQuery("SELECT MAX(id) + 1 AS id FROM notes");
    int idNewNote = getNewIdForNewNote.first['id'] as int;

    // Insert into table.
    return await db.rawInsert(
        "INSERT INTO notes (id, title, content) VALUES (?, ?, ?)",
        [idNewNote, inNote.title, inNote.content]);
  }

  Future<Note> get(int inID) async {
    Database db = await database;
    var noteRecord =
        await db.query("notes", where: "id = ?", whereArgs: [inID]);

    return noteFromMap(noteRecord.first);
  }

  Future<List> getAll() async {
    Database db = await database;
    var notes = await db.query("notes");
    var list =
        notes.isNotEmpty ? notes.map((m) => noteFromMap(m)).toList() : [];

    return list;
  }
}
