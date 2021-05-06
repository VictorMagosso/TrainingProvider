class Note {
  String name;
  String description;
  String date;
  bool isFinished;

  Note(
      {required this.name,
      required this.date,
      required this.description,
      this.isFinished = false});
}
