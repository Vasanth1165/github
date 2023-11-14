import 'package:flutter/material.dart';
import 'package:github/Provider/user_data_provider.dart';
import 'package:github/Widgets/previewprofile.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (BuildContext context, 
      UserDataProvider value, 
      Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Image.asset("assets/logo.png",color: Colors.white,width: 30,height: 30,),
            ),
          ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePreview(imgUrl: value.userData.avatarUrl.toString())));
                          },
                          child: Hero(
                            tag: "user_avtar_priview",
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(value.userData.avatarUrl.toString()),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                         Text("${value.userData.name}",style: const TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold
                              ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text(value.userData.followers.toString(),style: const TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(height: 10,),
                        const Text("Followers",style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    Container(
                      width: 2,
                      height: 80,
                      color: Colors.black,
                    ),
                   Column(
                      children: [
                        Text("${value.userData.following}",style: const TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Following",style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      );
      },
      
    );
  }
}