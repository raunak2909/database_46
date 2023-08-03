import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_note_page.dart';
import 'database_provider.dart';
import 'note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> notes =[];

  @override
  void initState() {
    super.initState();
    context.read<DatabaseProvider>().getInitialData();
  }

  /*void getNotes() async{
    notes = await MyDBHelper().fetchAllNotes();
    setState(() {

    });
    print(notes.length.toString());
    print(notes.toString());
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noted'),
      ),

      body: Consumer<DatabaseProvider>(
          builder: (context, provider, child) {
            notes = provider.arrData;
            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (ctx, index){
                  var currNote = notes[index];
                  return InkWell(
                    onTap: () async{
                      /*await MyDBHelper().updateNote(currNote['note_id'], "Updated Title", "Updated Desc");
                notes = await MyDBHelper().fetchAllNotes();
                setState(() {

                });*/
                    },
                    child: ListTile(
                      leading: Text('${index+1}'),
                      title: Text('${notes[index].title}'),
                      subtitle: Text('${notes[index].desc}'),
                      trailing: InkWell(
                          onTap: () async{
                            /*await MyDBHelper().deleteNote(currNote['note_id']);
                   notes = await MyDBHelper().fetchAllNotes();
                   setState(() {

                   });*/
                          },
                          child: Icon(Icons.delete, color: Colors.red,)),
                    ),
                  );
                });
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}