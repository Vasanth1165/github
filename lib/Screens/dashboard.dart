import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github/Provider/follower_provider.dart';
import 'package:github/Provider/repo_provider.dart';
import 'package:github/Provider/user_data_provider.dart';
import 'package:github/Screens/follower.dart';
import 'package:github/Widgets/loderwidget.dart';
import 'package:github/Widgets/previewprofile.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>  with SingleTickerProviderStateMixin{

  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(
      duration: const Duration(
        seconds: 2
      ),
      vsync: this);
    
    animation =IntTween(begin: 0,end: 0).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));

    animationController.forward();

  }
  @override
  Widget build(BuildContext context) {
    return Consumer3<UserDataProvider,RepoProvider,FollowersProvider>(
      builder: (BuildContext context, 
      UserDataProvider value,
      RepoProvider value1,
      FollowersProvider value2,
      Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Image.asset("assets/logo.png",color: Colors.white,width: 30,height: 30,),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(value.userData.login.toString(),style: const TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold
                              ),),
              ],
            ),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.logout_outlined))
            ],
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
                         Text("${value.userData.name} ",style: const TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold
                              ),),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyFollowers()));
                      },
                      child: Column(
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
               Visibility(
                visible: value1.repo.isEmpty ? false : true,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Repositories",style: TextStyle(
                                      fontSize: 18,fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(
                      width: 10,
                    ),
                    Badge(
                      largeSize: 50,
                      label: Text(value.userData.publicRepos.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    )
                  ],
                             ),
               ),
              const SizedBox(
                height: 10,
              ),
              value1.isloading ? const Center(child: MyLoder(),) :
              
              Visibility(
                visible: value1.repo.isEmpty ? false : true,
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value1.repo.length, 
                    itemBuilder: (context,i){
                    if (value1.repo.isNotEmpty) {
                      return  Column(
                        children: [
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            tileColor: Colors.black,
                            title: Text(value1.repo[i]["name"].toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value1.repo[i]["updated_at"].toString().substring(0,10),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            trailing: IconButton(
                              tooltip: "Url Copied",
                              onPressed: (){
                                Clipboard.setData(ClipboardData(text: value1.repo[i]["clone_url"].toString()));
                                Clipboard.getData("text");
                                print("Copied");
                              }, icon: const Icon(Icons.copy,color: Colors.white,)),
                            
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    }else{
                      if(value1.repo.isEmpty){
                        const Text("Repositories",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                      ));
                      }
                    }
                    return null;
                  }),
                ),
              )
            ],
          ),
        ),
      );
      },
      
    );
  }
}