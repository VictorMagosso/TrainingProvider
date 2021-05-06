import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_provider/controller/note_controller.dart';
import 'package:training_provider/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteController>.value(value: NoteController()),
      ],
      child: MaterialApp(
        title: 'Learning Provider',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
