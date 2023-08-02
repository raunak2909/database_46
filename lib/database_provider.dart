import 'package:flutter/material.dart';
import 'package:sqlite_46/my_db_helper.dart';
import 'package:sqlite_46/note_model.dart';

class DatabaseProvider extends ChangeNotifier{

  List<NoteModel> arrData = [];

  Future<void> addData(NoteModel note) async{
    bool check = await MyDBHelper().addNote(note);
    if(check){
      arrData = await MyDBHelper().fetchAllNotes();
      notifyListeners();
    } else {
      print("Data not added!!");
    }
  }

  Future<void> getInitialData() async{
    arrData = await MyDBHelper().fetchAllNotes();
    notifyListeners();
  }



}