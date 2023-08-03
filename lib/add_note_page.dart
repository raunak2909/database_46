import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database_provider.dart';
import 'note_model.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<DatabaseProvider>().addData(NoteModel(title: "Neww Chapter", desc: "Be Wise always.."));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}