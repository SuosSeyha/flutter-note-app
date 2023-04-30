import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/constant/const.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/service/auth_service.dart';
import 'package:note_app/service/note_service.dart';
import 'package:note_app/view/note_detail.dart';
import 'package:note_app/view/signin_page.dart';
import 'package:note_app/widget/wiget.dart';
import '../helper/helper_function.dart';
class HomeNoteApp extends StatefulWidget {
  String email;
  HomeNoteApp({super.key, 
    required this.email
  });

  @override
  State<HomeNoteApp> createState() => _HomeNoteAppState();
}

class _HomeNoteAppState extends State<HomeNoteApp> {
  AppStyle appStyle = AppStyle();
  AuthService authService = AuthService();
  final _titleController = TextEditingController();
  final _subtitleConller = TextEditingController();
  NoteService noteService = NoteService();

  final CollectionReference _tbnote = FirebaseFirestore.instance.collection('tbnote');
  var time = DateTime.now();
  String getDate(){
    String day = time.day.toString();
    String month = time.month.toString();
    String year = time.year.toString();
    return '$day/$month/$year';
  }
  void Clear(){
    _titleController.clear();
    _subtitleConller.clear();
  }
  void showForm(NoteModel? noteModel,DocumentSnapshot? documentSnapshot){
    if(noteModel!=null){
    _titleController.text=noteModel.title;
    _subtitleConller.text=noteModel.subtitle;
    }
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 700,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              // name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              // gender
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _subtitleConller,
                  decoration: const InputDecoration(
                    hintText: 'Subtitle',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
             
              //Button
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Clear();
                      Navigator.pop(context);
                    }, 
                    child: const Text('Cancel')
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        appStyle.buttonColor
                      )
                    ),
                    onPressed: () {
                        if(noteModel==null){
                          noteService.createNote(NoteModel(
                          title: _titleController.text, 
                          subtitle: _subtitleConller.text, 
                          date: getDate()
                        ));
                        }else{
                          noteService.updateNote(NoteModel(
                            title: _titleController.text, 
                          subtitle: _subtitleConller.text, 
                          date: getDate()
                          ), 
                          documentSnapshot!);
                        }
                        Clear();
                        Navigator.pop(context);
                    }, 
                    child: noteModel!=null ? const Text('Update') : const Text('Create')
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStyle.appBarColor,
        centerTitle: true,
        title: const Text(
          'Notes App'
        ),
      ),
      drawer:  Drawer(
        backgroundColor: appStyle.drawerColor,
        child: Column(
          children:  [
            DrawerHeader(
              child: Column(
                children:  [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/S.JPG'
                    ),
                    radius: 45,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5
                    ),
                    child:  Text(
                      widget.email,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                      ),
                    ),
                  )
                ],
              )
            ),
          
            InkWell(
              onTap: () async {
               await HelperFunction.UsersigninState(false);
               await authService.SignOutUser();
               // ignore: use_build_context_synchronously
              nextScreenReplacement(context,SigninScreen());
              },
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'L O G O U T'
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: _tbnote.snapshots(),
        builder: (context, snapshot) {
          // Error
          if(snapshot.hasError){
            return const Center(
              child: Text('No person data'),
            );
          }
          // Watting
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Success
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
              return  Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(), 
                  children: [
                      SlidableAction(
                        onPressed: (context) {
                          showForm(NoteModel(
                            title: documentSnapshot['title'], 
                            subtitle: documentSnapshot['subtitle'], 
                            date: documentSnapshot['date']
                            ),
                            documentSnapshot
                            );
                        },
                        foregroundColor: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Color.fromARGB(255, 195, 233, 197),
                        icon: Icons.edit,
                        label: 'Edit',
                    ),
                    SlidableAction(
                        onPressed: (context) {
                          noteService.deleteNote(documentSnapshot);
                        },
                        foregroundColor: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Color.fromARGB(255, 237, 213, 212),
                        icon: Icons.delete,
                        label: 'Delete',
                    )
                  ]
                  ),
                child:   Card(
                  child: GestureDetector(
                    onTap: () {
                      nextScreen(context,NoteDetail(
                        title: documentSnapshot['title'],
                        subtitle: documentSnapshot['subtitle'],
                      ));
                    },
                    child: ListTile(
                      tileColor:appStyle.listTileColor,
                      title:  Text(
                        documentSnapshot['title'],
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      subtitle: Text(
                        documentSnapshot['subtitle'],
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                        ),
                      trailing: Text(
                        documentSnapshot['date'],
                        style: const TextStyle(
                          color: Colors.grey
                        ),
                        ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appStyle.buttonColor,
        onPressed: () {
          showForm(null,null);
          Clear();
        },
        child: const Icon(
          Icons.add,
        ),
      ),

    );
  }
}