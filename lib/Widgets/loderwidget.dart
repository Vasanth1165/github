import 'package:flutter/material.dart';

class MyLoder extends StatefulWidget {
  const MyLoder({super.key});

  @override
  State<MyLoder> createState() => _MyLoderState();
}

class _MyLoderState extends State<MyLoder> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Colors.black,
      backgroundColor: Colors.grey,
    );
  }
}