import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_46/database_provider.dart';
import 'package:sqlite_46/my_db_helper.dart';
import 'package:sqlite_46/note_model.dart';

import 'home_page.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}








