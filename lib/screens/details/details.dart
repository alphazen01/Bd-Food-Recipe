
import 'dart:math';

import 'package:demo/database_helper.dart';
import 'package:demo/recipe_model.dart';
import 'package:demo/screens/fast_food/fast_food.dart';
import 'package:demo/screens/video/video.dart';
import 'package:demo/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DetailScreen extends StatelessWidget {
  static final String path="DetailScreen";
  Random random = Random();

    shareData(items){
    String data ="""
${items["title"]}

${items["ingredients"].toString()}

${items["directions"].toString()}
    
    """;
    Share.share("$data", subject: 'Look what I made!');
  }

  @override
  Widget build(BuildContext context) {
     final double size = MediaQuery.of(context).size.width;
     final Map items=ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Details"),
            Text("Category:${items["category"]}")
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){
             shareData(items["data"]);
            }, 
            icon: Icon(Icons.share)
            )
        ],
      ),
     body: Column(
       children: [
         Container(
           child: Stack(
             fit: StackFit.loose,
             children: [
               Image.asset(
                 items["data"]['image'],
                 fit:BoxFit.cover,
                 ),
                 Positioned(
                   bottom: 0,
                   child: Container(
                     width: size,
                     height: 56,
                     color:Colors.black.withOpacity(0.5) ,
                     child: Text(items["data"]["title"],
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 24
                     ),
                     ),
                     
                     ),
                 )
             ],
           )
             ),
         Row(
           children: [
             customButton(
               onTap: ()async{
               final recipeModel = RecipeModel(
                      id: random.nextInt(100),
                      title: items["data"]['title'],
                      image: items["data"]['image'],
                      ingredients: items["data"]["ingredients"].toString(),
                      directions: items["data"]["directions"].toString(),
                      youtubeUrl: items["data"]["youtubeUrl"]);
                  await DatabaseHelper.instance.addCookedRecipe(recipeModel);
               },
               icon: Icons.check_outlined,
               label: "Cooked",
               color: Colors.orange,
             ),
              customButton(
                onTap: ()async{
                   final recipeModel = RecipeModel(
                      id: random.nextInt(100),
                      title: items["data"]['title'],
                      image: items["data"]['image'],
                      ingredients: items["data"]["ingredients"].toString(),
                      directions: items["data"]["directions"].toString(),
                      youtubeUrl: items["data"]["youtubeUrl"]);
                  await DatabaseHelper.instance.addFavoriteRecipe(recipeModel);
                },
               icon: Icons.favorite,
               label: "Favorite",
               color: Colors.red,
               
             ),
             customButton(
               onTap: (){
                 Navigator.pushNamed(context, VideoScreen.path,
                 arguments: items["data"]
                 );
                 
               },
               icon: Icons.video_camera_front_outlined,
               label: "Videos",
               color: Colors.pink,
             )
              
           ],
         ),
         Expanded(
           child:SingleChildScrollView(
             child: Container(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Card(
                       elevation: 10,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: Text("Ingrdients",
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.w700
                               ),
                             ),
                           ),
                             Divider(
                         thickness: 3,
                         color: Colors.orange,
                       ),
                       for(int i=0; i<items["data"]["ingredients"].length; i++)
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           children: [
                             Container(
                             height: 8,
                             width: 8,
                             decoration: BoxDecoration(
                               color: Colors.red,
                               borderRadius: BorderRadius.circular(4),
                             ),  
                             ),
                             SizedBox(
                               width: 10,
                             ),
                              Expanded(child: Text(items["data"]['ingredients'][i])),
                           ],
                         ),
                       ),
                      
                         ],
                       ),
                     ),
                      SizedBox(
                       height: 15,
                     ),
                     Card(
                       elevation: 10,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: Text("Directions",
                             style: TextStyle(fontSize: 18),
                             ),
                           ),
                             Divider(
                         thickness: 3,
                         color: Colors.orange,
                       ),
                       for(int i=0; i<items["data"]["directions"].length; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                           children: [
                             Container(
                             height: 8,
                             width: 8,
                             decoration: BoxDecoration(
                               color: Colors.red,
                               borderRadius: BorderRadius.circular(4),
                             ),  
                             ),
                             SizedBox(
                               width: 10,
                             ),
                              Expanded(
                                child: 
                                Text(items["data"]['directions'][i]
                                )
                                ),
                           ],
                       ),
                        ),
                      
                       
                         ],
                       ),
                     ),
                   
                    
                     
                   ],
                 ),
               ),
             ),
           ),
         )
       ],
     ),
    );
  }
}

