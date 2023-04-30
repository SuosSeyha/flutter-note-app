import 'package:flutter/material.dart';
class AppStyle{
  var bodyColor = Colors.white.withOpacity(0.4);
  var iconColor = Colors.red;
  var borderColor = Colors.white;
  var buttonColor = Colors.red;
  var textColor   = Colors.black;
  var textformfieldColor = Colors.white.withOpacity(0.3);
  var textFieldColor = Colors.black.withOpacity(0.6);
  var appBarColor = Colors.redAccent;
  var drawerColor = Colors.grey[300];
  var listTileColor = Color.fromARGB(255, 236, 204, 195);

  var emailStyle = InputDecoration(
    
    label: const Text(
      'Enter email',
    ),
    labelStyle: TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.bold
    ),
    prefixIcon:  const Icon(Icons.email,color: Colors.red,),
    fillColor: Colors.white.withOpacity(0.3),
    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide:  const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:  const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
    errorBorder: OutlineInputBorder(
      borderSide:  const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20),
    ),
    
  );
  var passwordStyle = InputDecoration(
    label: const Text(
      'Enter password',
    ),
    labelStyle: TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.bold
    ),
    prefixIcon:  const Icon(Icons.lock,color: Colors.red,),
    fillColor: Colors.white.withOpacity(0.3),
    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide:  const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:  const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
    errorBorder: OutlineInputBorder(
      borderSide:  const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20),
    ),
    
  );
  var confirmpasswordStyle = InputDecoration(
    label: const Text(
      'Enter confirm password',
    ),
    labelStyle: TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.bold
    ),
    prefixIcon:  const Icon(Icons.lock,color: Colors.red,),
    fillColor: Colors.white.withOpacity(0.3),
    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide:  const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:  const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
    errorBorder: OutlineInputBorder(
      borderSide:  const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20),
    ),
    
  );
}