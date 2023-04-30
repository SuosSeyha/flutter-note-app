class NoteModel{
  String title,subtitle,date;

  NoteModel({
    required this.title,
    required this.subtitle,
    required this.date
  });

  Map<String,dynamic> toMap(){
    return {
       'title': title,
       'subtitle': subtitle,
       'date': date
    };
  }
}