import 'package:demo/screens/bread/bread.dart';
import 'package:demo/screens/dessert/dessert.dart';
import 'package:demo/screens/fast_food/fast_food.dart';
import 'package:demo/screens/non_veg/non_veg.dart';
import 'package:demo/screens/rice/rice.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final String path="HomeScreen";
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, 
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("BD FOOD RECIPE"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.favorite)
                )
            ],
          ),
          drawer: Drawer(),
          body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
          TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
            gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.orangeAccent]
            ),
            borderRadius: BorderRadius.circular(50),
            color: Colors.redAccent
            ),
            
          tabs: [
           Tab(
             child: Text("Rice"),
           ), 
            Tab(
             child: Text("Bread"),
           ),   
            Tab(
             child: Text("Fast-Food"),
           ),   
            Tab(
             child: Text("Non-Veg"),
           ),
           Tab(
             child: Text("Dessert"),
           ),   
            
         ]
        ),
        Expanded(
          child: TabBarView(
            children: [
              RiceScreen(),
              BreadScreen(),
              FastFoodScreen(),
              NonVegScreeen(),
              DessertScreen()
            ]
            ),
        )
        ],
       ),
      ),
    );
  }
}