import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_app/helper/helper_function.dart';
import 'package:note_app/view/home_note.dart';
import 'package:note_app/view/signin_page.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isloadigState=false;
  @override
  void initState() {
    super.initState();
    HelperFunction.GetusersigninState().then((value){
      setState(() {
        _isloadigState=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: _isloadigState ?  HomeNoteApp(email: '',) : SigninScreen(),
    );
  }
}
