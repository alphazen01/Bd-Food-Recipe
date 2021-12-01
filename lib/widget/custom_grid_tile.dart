import 'package:flutter/material.dart';

class customGridTile extends StatelessWidget {
  final String?imageUrl;
  final String? title;
  final VoidCallback? onTap;
  const customGridTile({
    Key? key,
    this.imageUrl,
    this.title, 
    this.onTap
   
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        child: GridTile(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("$imageUrl"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("$title"),
                ),
                Row(
                  children: [
                    Icon(Icons.watch),
                    Text("30 min"),
                    Row(
                  children: [
                    Icon(Icons.food_bank),
                    Text("15 ingredients")
                  ],
                )
                  ],
                ),
                 
              ],
            ),
          )
        ),
      ),
    );
  }
}