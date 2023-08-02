import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_46/note_model.dart';

class MyDBHelper{
  var NOTE_TABLE = "note";
  var COLUMN_NOTE_ID = "note_id";
  var COLUMN_NOTE_TITLE = "title";
  var COLUMN_NOTE_DESC = "desc";


  Future<Database> openDB() async{

    //directory path
    var mDirectory = await getApplicationDocumentsDirectory();

    //created the path
    await mDirectory.create(recursive: true);

    var dbPath = "$mDirectory/notedb.db";

    return await openDatabase(dbPath, version: 1, onCreate: (db, version){

      var createTableQuery = "create table $NOTE_TABLE ( $COLUMN_NOTE_ID integer primary key autoincrement, $COLUMN_NOTE_TITLE text, $COLUMN_NOTE_DESC text)";

      db.execute(createTableQuery);
      //db.insert(NOTE_TABLE, {});
    });


  }

  Future<bool> addNote(NoteModel note) async{
    var db = await openDB();
    var check = await db.insert(NOTE_TABLE, note.toMap());
    return check>0;
  }

  Future<List<NoteModel>> fetchAllNotes() async{
    var db = await openDB();
    List<Map<String, dynamic>> notes = await db.query(NOTE_TABLE);
    List<NoteModel> listNotes = [];

    for(Map<String, dynamic> note in notes){
      listNotes.add(NoteModel.fromMap(note));
    }
    return listNotes;
  }

  Future<bool> updateNote(int id, String title, String desc) async{
    var db = await openDB();

    var check = await db.update(NOTE_TABLE, {COLUMN_NOTE_TITLE : title, COLUMN_NOTE_DESC : desc}, where: "$COLUMN_NOTE_ID = $id");

    return check>0;
  }

  Future<bool> deleteNote(int id) async{
    var db = await openDB();

    return await db.delete(NOTE_TABLE, where: "$COLUMN_NOTE_ID = ?", whereArgs: ['$id'])>0;

  }


}