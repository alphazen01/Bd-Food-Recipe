import 'package:demo/widget/custom_button.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static final String path="DetailScreen";
  
  const DetailScreen({ Key? key }) : super(key: key);

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
                       color: Colors.white
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
               icon: Icons.check_outlined,
               label: "Checked",
               color: Colors.orange,
             ),
              customButton(
               icon: Icons.favorite,
               label: "Favorite",
               color: Colors.red,
             ),
              customButton(
               icon: Icons.video_camera_front_outlined,
               label: "Video",
               color: Colors.pink,
             )
           ],
         ),
         Expanded(
           child:SingleChildScrollView(
             child: Container(
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
                           style: TextStyle(fontSize: 16),
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
                            Text(items["data"]['ingredients'][i]),
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
                           style: TextStyle(fontSize: 16),
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
         )
       ],
     ),
    );
  }
}

