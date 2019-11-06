import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_note_screen.dart';
import '../providers/notes.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your notes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddNote.routeName);
            },
          ),
        ],
      ),
      body: Consumer<Notes>(
        child: Center(
          child: const Text(
            'No notes yet!',
          ),
        ),
        builder: (ctx, notes, ch) => notes.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: notes.items.length,
                itemBuilder: (ctx, i) => Container(
                  height: 220,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15),
                          ),
                          child: Image.file(
                            notes.items[i].image,
                            width: 100,
                            height: 210,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 210,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  notes.items[i].title,
                                  style: Theme.of(context).textTheme.title,
                                ),
                                Expanded(
                                    child: SingleChildScrollView(
                                        child: Text(notes.items[i].text))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
