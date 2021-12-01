import 'package:demo/global/functions.dart';
import 'package:demo/screens/data/data.dart';
import 'package:demo/widget/custom_grid_tile.dart';
import 'package:flutter/material.dart';

class NonVegScreeen extends StatelessWidget {
    static final String path="NonVegScreeen";
   final List non_veg=bdfood["non_veg"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    gridDelegate: customGridDeleget(),
       itemCount: non_veg.length, 
    itemBuilder: (BuildContext context, int index){
      return customGridTile(
        imageUrl: non_veg[index]["image"],
        title: non_veg[index]["title"],
      );
    }
    );
  }

}
