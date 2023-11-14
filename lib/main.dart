import 'package:flutter/material.dart';
import 'package:github/Provider/follower_provider.dart';
import 'package:github/Provider/repo_provider.dart';
import 'package:github/Provider/user_data_provider.dart';
import 'package:github/Screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create:(context) => UserDataProvider()),
      ChangeNotifierProvider(create: (context) => RepoProvider()),
      ChangeNotifierProvider(create: (context)=> FollowersProvider())
    ],
    child:  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
    );
  }
}