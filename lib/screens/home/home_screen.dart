import 'package:demo/screens/bread/bread.dart';
import 'package:demo/screens/dessert/dessert.dart';
import 'package:demo/screens/fast_food/fast_food.dart';
import 'package:demo/screens/non_veg/non_veg.dart';
import 'package:demo/screens/rice/rice.dart';
import 'package:demo/screens/video/video.dart';
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
                onPressed: (){
                  Navigator.pushNamed(context, VideoScreen.path);
                }, 
                icon: Icon(Icons.favorite)
                )
            ],
          ),
          drawer: Theme(
            data:Theme.of(context).copyWith(
              canvasColor: Color(0xff292B3E)
            ) ,
            child: Drawer(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset("assets/images/rice/1.jpg")
                    ],
                    ),
                 ListTile(
                   onTap:(){} ,
                  title:Text("All Recipes",
                  style: TextStyle(color: Colors.white),
                  ), 
                ),
                 
                     ListTile(
                      onTap: (){},
                      title:Text("My Recipes",
                      style: TextStyle(color: Colors.white),
                      ),
                      trailing: Container(
                        height: 25,
                        width: 25,
                        color: Colors.red,
                        child: Center(
                          child: Text("0",
                          style: TextStyle(
                            color: Colors.white
                         ),
                         ),
                        ),
                      ),
                    ),
                   
                 
                 ListTile(
                  onTap: (){},
                  title:Text("Favourite",
                  style: TextStyle(color: Colors.white),
                  ),
                  trailing: Container(
                    height: 25,
                    width: 25,
                    color: Colors.red,
                    child: Center(
                      child: Text("1",
                      style: TextStyle(
                        color: Colors.white
                     ),
                     ),
                    ),
                  ),
                ),
                 ListTile(
                  onTap: (){},
                  title:Text("Cooked",
                  style: TextStyle(color: Colors.white),
                  ),
                  trailing: Container(
                    height: 25,
                    width: 25,
                    color: Colors.red,
                    child: Center(
                      child: Text("0",
                      style: TextStyle(
                        color: Colors.white
                     ),
                     ),
                    ),
                  ),
                ),
                 ListTile(
                  onTap: (){},
                  title:Text("Tips",
                  style: TextStyle(color: Colors.white),
                  ),
                  trailing: Container(
                    height: 25,
                    width: 25,
                    color: Colors.red,
                    child: Center(
                      child: Text("50+",
                      style: TextStyle(
                        color: Colors.white
                     ),
                     ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("MORE",
                  style: TextStyle(color: Colors.white),
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.10),
                  thickness: 3,
                ),
                 ListTile(
                  onTap: (){},
                  leading: Icon(Icons.search,
                  color: Colors.white,
                  ),
                  title:Text("Search Recipe",
                  style: TextStyle(color: Colors.white),
                  ),
                ),
                 ListTile(
                  onTap: (){},
                  leading: Icon(Icons.thumb_up,
                  color: Colors.white,
                  ),
                  title:Text("Rate Us",
                  style: TextStyle(color: Colors.white),
                  ),
                ),
                ],
              ),
            ), 
            ),
          ),
          body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.redAccent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
              gradient: LinearGradient(
              colors: [Colors.redAccent, Colors.orangeAccent]
              ),
              // borderRadius: BorderRadius.circular(50),
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