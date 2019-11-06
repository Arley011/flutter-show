import 'package:flutter/material.dart';
import './screens/notes_list_screen.dart';
import './screens/add_note_screen.dart';
import 'package:provider/provider.dart';
import './providers/notes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Notes(),
      child: MaterialApp(
        title: 'List of notes',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amberAccent
        ),
        home: NotesList(),
        routes: {
          AddNote.routeName: (ctx) => AddNote(),
        },
      ),
    );
  }
}

