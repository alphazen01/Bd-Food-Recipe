import 'package:demo/details/dtails.dart';
import 'package:demo/global/functions.dart';
import 'package:demo/screens/data/data.dart';
import 'package:demo/widget/custom_grid_tile.dart';
import 'package:flutter/material.dart';

class RiceScreen extends StatelessWidget {
  static final String path="RiceScreen";
 final List rice=bdfood["rice"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    gridDelegate: customGridDeleget(),
       itemCount: rice.length, 
    itemBuilder: (BuildContext context, int index){
      return customGridTile(
        onTap: (){
          Navigator.pushNamed(context, DetailScreen.path,
          arguments:{"category":"Rice","data":rice[index]});
        },
        imageUrl: rice[index]["image"],
        title: rice[index]["title"],
      );
    }
    );
  }

}

