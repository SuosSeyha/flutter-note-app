import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/model/note_model.dart';

class NoteService{
   final CollectionReference _tbnote = FirebaseFirestore.instance.collection('tbnote');
  // Create
  Future createNote(NoteModel noteModel)async{
    await _tbnote.add(noteModel.toMap());
  }
  // Update
  Future updateNote(NoteModel noteModel,DocumentSnapshot documentSnapshot) async{
    await _tbnote.doc(documentSnapshot.id).update(noteModel.toMap());
  }
  // Delete
  Future deleteNote(DocumentSnapshot documentSnapshot)async{
    await _tbnote.doc(documentSnapshot.id).delete();
  }
}