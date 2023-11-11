import 'package:flutter/material.dart';
import 'package:github/Models/userdata.dart';

class UserDataProvider extends ChangeNotifier{
  UserData _userdata=UserData();
  UserData get userData=> _userdata;

  Future getUserData(String userid) async{
    

  }


}