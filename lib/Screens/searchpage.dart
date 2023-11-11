

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Image(image: AssetImage("assets/logo.png"),width: 75,height: 75,)),
          const SizedBox(height: 10,),
          const Text("GitHub",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 3),
                borderRadius: BorderRadius.circular(30)
              ),
              child: TextFormField(
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
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(child: IntrinsicWidth(
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
          ))

        ],
      ),
    );
  }
}