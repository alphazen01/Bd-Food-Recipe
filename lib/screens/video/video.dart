import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  static const String path="VideoScreen";
  const VideoScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
       title: Text("data"),
     )
    );
  }
}