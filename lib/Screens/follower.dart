import 'package:flutter/material.dart';
import 'package:github/Provider/follower_provider.dart';
import 'package:github/Widgets/previewprofile.dart';
import 'package:provider/provider.dart';

class MyFollowers extends StatefulWidget {
  const MyFollowers({super.key});

  @override
  State<MyFollowers> createState() => _MyFollowersState();
}

class _MyFollowersState extends State<MyFollowers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Consumer<FollowersProvider>(builder:(context, value, child) {
        // print(value.followers[0]["login"]);
        print(value.followers.length);
        if (value.followers.isNotEmpty) {
            return ListView.builder(
              itemCount: value.followers.length,
              itemBuilder: (context,i){
              return ListTile(
                leading: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePreview(imgUrl: value.followers[i]["avatar_url"])));
                  },
                  child: Hero(
                    tag: "user_avtar_priview",
                    child: CircleAvatar(backgroundImage: NetworkImage(value.followers[i]["avatar_url"]),radius: 20,))),
                title: Text(value.followers[i]["login"].toString(),style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              );
                  });
          }else{
            return const Center(child: Text("FOLLOWERS NOT FOUND",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),);
          }
      },)
    );
  }
}