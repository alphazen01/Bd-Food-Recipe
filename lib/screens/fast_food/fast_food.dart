import 'package:demo/global/functions.dart';
import 'package:demo/screens/data/data.dart';
import 'package:demo/widget/custom_grid_tile.dart';
import 'package:flutter/material.dart';

class FastFoodScreen extends StatelessWidget {
  static final String path="FastFoodScreen";
  final List fast_food=bdfood["fast_food"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    gridDelegate: customGridDeleget(),
       itemCount: fast_food.length, 
    itemBuilder: (BuildContext context, int index){
      return customGridTile(
        imageUrl: fast_food[index]["image"],
        title: fast_food[index]["title"],
      );
    }
    );
  }

}
