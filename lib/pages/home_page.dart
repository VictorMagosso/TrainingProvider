import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_provider/controller/note_controller.dart';
import 'package:training_provider/model/notes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//se criar uma instancia, nao vai funcionar pois ele precisar ser uma instancia
//passada dentro de consumer. Para isso, tem que chamar o Provider.of dentro da classe do widget
  _buildNotes() {
    NoteController noteController = Provider.of<NoteController>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildItems(noteController.notes[index], noteController);
      },
      itemCount: noteController.notes.length,
    );
  }

  _buildItems(Note model, NoteController noteController) {
    return ListTile(
      onTap: () => noteController.setNoteStatus(model),
      trailing: model.isFinished
          ? Icon(
              Icons.check,
              color: Colors.green,
            )
          : Icon(Icons.check),
      title: Text(model.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Trainings Provider'),
            Consumer<NoteController>(
              builder: (context, noteController, child) {
                return Text(noteController.finishedNotes.toString());
              },
            ),
          ],
        ),
      ),
      body: Consumer<NoteController>(
        builder: (context, noteController, child) {
          return _buildNotes();
        },
      ),
    );
  }
}
