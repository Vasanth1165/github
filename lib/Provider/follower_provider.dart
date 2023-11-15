
import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:github/Widgets/snakbarwidget.dart';
import 'package:http/http.dart' as http;
class FollowersProvider extends ChangeNotifier{
  List<dynamic> _followers=[];
  List<dynamic> get followers=> _followers;
  bool _isloading=false;
  bool get isloading=> _isloading;

  void setLoading(bool val){
    _isloading=val;
    notifyListeners();
  }

  Future getFollowersData(BuildContext context,String userid) async{
    setLoading(true);
    await http.get(Uri.parse("https://api.github.com/users/$userid/followers"))
    .then((res){
      if(res.statusCode==200){
        _followers = jsonDecode(res.body);
        _isloading=false;
        notifyListeners();
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashBoard()));
      }else{
        setLoading(false);
        // Utils().Snakbar(context, "Try after some time");
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