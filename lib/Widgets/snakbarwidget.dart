import 'package:flutter/material.dart';

class Utils{
  void Snakbar(BuildContext context,String mess){
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(mess,style: const TextStyle(color: Colors.white,fontSize: 18),),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  ));
  }
}