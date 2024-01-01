

import 'package:flutter/material.dart';
import 'package:github/Provider/theme_change_provider.dart';
import 'package:github/Provider/user_data_provider.dart';
import 'package:github/Screens/dashboard.dart';
import 'package:github/Widgets/loderwidget.dart';
import 'package:github/Widgets/snakbarwidget.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final userID=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    userID.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserDataProvider>(context);
    final theme=Provider.of<ThemeChanger>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Hero(
              tag: "app_logo",
              child: Image(image: AssetImage("assets/logo.png"),width: 75,height: 75,))),
            const SizedBox(height: 10,),
            const Text("GitHub",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Container(
               constraints: const BoxConstraints(
                  minWidth: 200,
                  maxWidth: 300
                ) ,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 3),
                borderRadius: BorderRadius.circular(30)
              ),
              child: TextField(
                controller: userID,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: "Enter UserID",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)
                ),
                style: const TextStyle(
                  color: Colors.black
                ),
              ),
            
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: !user.isloading,
              child: IntrinsicWidth(
              child: GestureDetector(
                onTap: (){
                  if(userID.text.trim().isNotEmpty){
                    user.getUserData(context, userID.text.trim().toString());
                  }else{
                    Utils().Snakbar(context, "Enter UserID");
                  }
                },
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.bold),),
                    ),
                  ),
                ),
              ),
            )),
            Visibility(
              visible: user.isloading,
              child: const MyLoder())
          ],
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartDocked,
        floatingActionButton: theme.isDark ? GestureDetector(
          onTap: (){
            theme.setTheme(ThemeMode.light);
          },
          child: const Icon(Icons.light_mode)) 
          : GestureDetector(
            onTap: (){
              theme.setTheme(ThemeMode.dark);
            },
            child: const Icon(Icons.dark_mode))
      ),
    );
  }
}