import 'package:demo/database_helper.dart';
import 'package:demo/recipe_model.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
   static final String path="Favorite";
  const Favorite({ Key? key }) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
   countIngradients(ingradients) {
    var _ingradients =
        ingradients.toString().replaceAll("[", "").replaceAll("]", "");
    var splitIngradients = _ingradients.split(",");
    return splitIngradients.length;
  }

  countDirections(directions) {
    var _directions =
        directions.toString().replaceAll("[", "").replaceAll("]", "");
    var splitDirections = _directions.split(",");
    return splitDirections.length;
  }
    bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Favorite"),
        backgroundColor: Colors.red,
      ),
     body: Container(
        height: 400,
        child: FutureBuilder(
          future: DatabaseHelper.instance.getFavoriteRecipe(),
          builder: (BuildContext context,
              AsyncSnapshot<List<RecipeModel>> snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading......");
            }
            return isLoading
                ? CircularProgressIndicator()
                : ListView(
                    children: snapshot.data!.map((recipe) {
                      return Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              recipe.image!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${recipe.title}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ingradients:  ${countIngradients(recipe.ingredients)}",
                                        
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Directions:  ${countDirections(recipe.directions)}",
                                        
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                DatabaseHelper.instance.deleteFavoriteItem(recipe.id);
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
      ),
    );
  }
}