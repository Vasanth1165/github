
import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:github/Widgets/snakbarwidget.dart';
import 'package:http/http.dart' as http;

class RepoProvider extends ChangeNotifier{
  List<dynamic> _repo=[];
  List<dynamic> get repo=> _repo;
  bool _isloading=false;
  bool get isloading=> _isloading;

  void setLoading(bool val){
    _isloading=val;
    notifyListeners();
  }

  Future getRepoData(BuildContext context,String userid) async{
    setLoading(true);
    await http.get(Uri.parse("https://api.github.com/users/$userid/repos"))
    .then((res){
      if(res.statusCode==200){
        _repo = jsonDecode(res.body);
        _isloading=false;
        notifyListeners();
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