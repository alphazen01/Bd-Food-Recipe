import 'package:demo/global/functions.dart';
import 'package:demo/screens/data/data.dart';
import 'package:demo/screens/details/details.dart';
import 'package:demo/widget/custom_grid_tile.dart';
import 'package:flutter/material.dart';

class DessertScreen extends StatelessWidget {
  static final String path="DessertScreen";
 final List dessert=bdfood["dessert"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    gridDelegate: customGridDeleget(),
       itemCount: dessert.length, 
    itemBuilder: (BuildContext context, int index){
      return customGridTile(
        onTap: (){
          Navigator.pushNamed(context, DetailScreen.path,
          arguments:{"category":"Dessert","data":dessert[index]});
        },
        imageUrl: dessert[index]["image"],
        title: dessert[index]["title"],
      );
    }
    );
  }

}
