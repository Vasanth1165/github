import 'package:flutter/material.dart';

class ProfilePreview extends StatefulWidget {
  final String imgUrl;
  const ProfilePreview({super.key,required this.imgUrl});

  @override
  State<ProfilePreview> createState() => _ProfilePreviewState();
}

class _ProfilePreviewState extends State<ProfilePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(  
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Hero(tag: "user_avtar_priview"
        , child: Image(image: NetworkImage(widget.imgUrl))),
      ),
    );
  }
}