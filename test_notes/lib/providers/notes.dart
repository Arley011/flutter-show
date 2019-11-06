import 'dart:io';

import 'package:flutter/material.dart';
import '../models/note.dart';

class Notes with ChangeNotifier {
  List<Note> _items = [];

  List<Note> get items {
    return [..._items];
  }

  void addNote(String title, File pickedImage, String text) {
    final newNote = Note(
      id: DateTime.now().toString(),
      title: title,
      image: pickedImage,
      text: text,
    );
    _items.add(newNote);
    notifyListeners();

  }
}
