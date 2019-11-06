import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes.dart';
import '../widgets/image_input.dart';

class AddNote extends StatefulWidget {
  static const routeName = '/add-note';

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final _titleController = TextEditingController();
  final _textController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _saveNote(){
    if(_titleController.text.isEmpty || _pickedImage == null || _textController.text.isEmpty){
      return;
    }
    Provider.of<Notes>(context, listen: false).addNote(_titleController.text, _pickedImage, _textController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Note'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                    controller: _textController,
                  ),
                  SizedBox(height: 10,),
                  ImageInput(_selectImage),
                ],),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _saveNote,
            icon: Icon(Icons.add),
            label: Text('Add Note'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
