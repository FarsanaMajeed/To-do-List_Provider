import 'package:flutter/cupertino.dart';

import 'notes.dart';
class NotesProvider extends ChangeNotifier{
   final List <Notes> _notes= <Notes>[];

  List<Notes> get getNotes{
    return _notes;
  }



  void addNotes(String title,String description){
    Notes notes = Notes(title, description);
    _notes.add(notes);
    notifyListeners();
  }

  void removeNotes( int index){
    _notes.removeAt(index);
    notifyListeners();
  }
}