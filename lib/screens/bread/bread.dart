import 'package:demo/global/functions.dart';
import 'package:demo/screens/data/data.dart';
import 'package:demo/widget/custom_grid_tile.dart';
import 'package:flutter/material.dart';

class BreadScreen extends StatelessWidget {
   static final String path="BreadScreen";
  final List bread=bdfood["bread"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    gridDelegate: customGridDeleget(),
       itemCount: bread.length, 
    itemBuilder: (BuildContext context, int index){
      return customGridTile(
        imageUrl: bread[index]["image"],
        title: bread[index]["title"],
      );
    }
    );
  }

}
