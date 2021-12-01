import 'package:demo/widget/custom_button.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static final String path="DetailScreen";
  
  const DetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final double size = MediaQuery.of(context).size.width;
     final Map data=ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("DetailScreen"),
      ),
     body: Column(
       children: [
         Container(
           child: Stack(
             fit: StackFit.loose,
             children: [
               Image.asset(
                 data["image"],
                 fit:BoxFit.cover,
                 ),
                 Positioned(
                   bottom: 0,
                   child: Container(
                     width: size,
                     height: 56,
                     color:Colors.black.withOpacity(0.5) ,
                     child: Text(data["title"],
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
               icon: Icons.check_outlined,
               label: "Checked",
               color: Colors.red,
             ),
              customButton(
               icon: Icons.check_outlined,
               label: "Checked",
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
                         Text("Ingrdients"),
                           Divider(
                       thickness: 3,
                       color: Colors.orange,
                     ),
                     for(int i=0; i<data["ingredients"].length; i++)
                     Row(
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
                          Text(data['ingredients'][i]),
                       ],
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
                         Text("Directions"),
                           Divider(
                       thickness: 3,
                       color: Colors.orange,
                     ),
                     for(int i=0; i<data["directions"].length; i++)
                      Row(
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
                            Text(data['directions'][i]
                            )
                            ),
                       ],
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

