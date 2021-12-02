import 'package:demo/details/dtails.dart';
import 'package:demo/global/functions.dart';
import 'package:demo/screens/data/data.dart';
import 'package:demo/widget/custom_grid_tile.dart';
import 'package:flutter/material.dart';

class BreadScreen extends StatelessWidget {
   static final String path="RiceScreen";
 final List bread=bdfood["bread"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    gridDelegate: customGridDeleget(),
       itemCount: bread.length, 
    itemBuilder: (BuildContext context, int index){
      return customGridTile(
        onTap: (){
          Navigator.pushNamed(context, DetailScreen.path,arguments:{"category":"Bread","data":bread[index]});
        },
        imageUrl: bread[index]["image"],
        title: bread[index]["title"],
      );
    }
    );
  }

}
