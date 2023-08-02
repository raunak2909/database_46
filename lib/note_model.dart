import 'package:sqlite_46/my_db_helper.dart';

class NoteModel {
  int? id;
  String? title;
  String? desc;

  NoteModel({this.id, this.title, this.desc});

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        title: map[MyDBHelper().COLUMN_NOTE_TITLE],
        desc: map[MyDBHelper().COLUMN_NOTE_DESC]);
  }

  Map<String, dynamic> toMap(){
    return {
      MyDBHelper().COLUMN_NOTE_ID: id,
      MyDBHelper().COLUMN_NOTE_TITLE: title,
      MyDBHelper().COLUMN_NOTE_DESC: desc
    };
  }
}
