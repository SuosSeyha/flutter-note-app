import 'package:flutter/material.dart';
void showMessageAlert(context,String message,color){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: const Duration(seconds: 3),
      
  ));
}
nextScreenReplacement(context,page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page,));
}
nextScreen(context,page){
  Navigator.push(context, MaterialPageRoute(builder: (context) => page,));
}