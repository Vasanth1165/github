
import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:github/Models/userdata.dart';
import 'package:github/Screens/dashboard.dart';
import 'package:github/Widgets/snakbarwidget.dart';
import 'package:http/http.dart' as http;
class UserDataProvider extends ChangeNotifier{
  UserData _userdata=UserData();
  UserData get userData=> _userdata;
  bool _isloading=false;
  bool get isloading=> _isloading;

  void setLoading(bool val){
    _isloading=val;
    notifyListeners();
  }

  Future getUserData(BuildContext context,String userid) async{
    setLoading(true);
    await http.get(Uri.parse("https://api.github.com/users/$userid"))
    .then((res){
      if(res.statusCode==200){
        _userdata = UserData.fromJson(jsonDecode(res.body));
        _isloading=false;
        notifyListeners();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashBoard()));
      }else if(res.statusCode==404){
        setLoading(false);
        Utils().Snakbar(context, "Enter valid userID");
      }else{
        setLoading(false);
        Utils().Snakbar(context, "Try after some time");
      }
    }).onError((error, stackTrace) {
      if(error is SocketException){
        setLoading(false);
        Utils().Snakbar(context, "please Connect to Internet");
      }else{
        setLoading(false);
        throw Exception(error);
      }
    });
  }


}