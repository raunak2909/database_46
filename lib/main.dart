import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_46/database_provider.dart';
import 'package:sqlite_46/my_db_helper.dart';
import 'package:sqlite_46/note_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(context) => DatabaseProvider(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}

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




