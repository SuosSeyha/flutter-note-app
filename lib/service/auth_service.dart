import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/widget/wiget.dart';
class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
 // create method register
 Future<bool?> RegisterUser(context,String email,String password)async{
    try{
       User user =(await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;
       if(user!=null){
        return true;
       }else{
        return false;
       }
    }on FirebaseAuthException catch(e){
      showMessageAlert(context,e.message.toString(),Colors.red);
    }
 }
 // create method sign in
  Future<bool?> SigninUser(context,String email,String password)async{
    try{
       User user =(await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user!;
       if(user!=null){
        return true;
       }else{
        return false;
       }
    }on FirebaseAuthException catch(e){
      showMessageAlert(context,e.message.toString(),Colors.red);
    }
 }
 // create method sigin out
 Future SignOutUser()async{
  await firebaseAuth.signOut();
 }
}