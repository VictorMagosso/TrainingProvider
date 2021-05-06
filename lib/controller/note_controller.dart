import 'package:flutter/cupertino.dart';
import 'package:training_provider/model/notes.dart';

class NoteController extends ChangeNotifier {
  List<Note> notes = [
    Note(name: 'Nota 1', date: '05/05/2021', description: 'descricao'),
    Note(name: 'Nota 2', date: '06/05/2021', description: 'descricao2'),
    Note(name: 'Nota 3', date: '05/01/2021', description: 'descricao3'),
    Note(name: 'Nota 4', date: '28/05/2021', description: 'descricao4'),
    Note(name: 'Nota 5', date: '30/09/2021', description: 'descricao5'),
    Note(name: 'Nota 6', date: '27/02/2021', description: 'descricao6'),
    Note(name: 'Nota 7', date: '05/05/2021', description: 'descricao7'),
  ];

  int finishedNotes = 0;

  void setNoteStatus(Note model) {
    model.isFinished = !model.isFinished;
    countFinishedNotes();
    notifyListeners();
  }

  void countFinishedNotes() {
    finishedNotes = notes.where((element) => element.isFinished).length;
  }
}
