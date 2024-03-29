
import 'package:demo/about.dart';
import 'package:demo/cooked.dart';
import 'package:demo/favorite.dart';
import 'package:demo/screens/bread/bread.dart';
import 'package:demo/screens/dessert/dessert.dart';
import 'package:demo/screens/details/details.dart';
import 'package:demo/screens/fast_food/fast_food.dart';
import 'package:demo/screens/home/home_screen.dart';
import 'package:demo/screens/non_veg/non_veg.dart';
import 'package:demo/screens/rice/rice.dart';
import 'package:demo/screens/video/video.dart';
import 'package:demo/tips.dart';

import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      
      debugShowCheckedModeBanner: false,
      // home: HomeScreen()
      // home: DetailScreen(),
      initialRoute: HomeScreen.path,
      routes:{
        HomeScreen.path:(ctx)=>HomeScreen(),
        BreadScreen.path:(ctx)=>BreadScreen(),
        FastFoodScreen.path:(ctx)=>FastFoodScreen(),
        NonVegScreeen.path:(ctx)=>NonVegScreeen(),
        DetailScreen.path:(ctx)=>DetailScreen(),
        DessertScreen.path:(ctx)=>DessertScreen(),
        RiceScreen.path:(ctx)=>RiceScreen(),
        VideoScreen.path:(ctx)=>VideoScreen(),
        Favorite.path:(ctx)=>Favorite(),
        Cooked.path:(ctx)=>Cooked(),
        TipsScreen.path:(ctx)=>TipsScreen(),
        AboutScreen.path:(ctx)=>AboutScreen(),
        
        
       
      }
      
    )
  );
}

