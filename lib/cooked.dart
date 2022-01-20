import 'package:demo/database_helper.dart';
import 'package:demo/recipe_model.dart';
import 'package:flutter/material.dart';

class Cooked extends StatefulWidget {
  static final String path="Cooked";
  const Cooked({ Key? key }) : super(key: key);

  @override
  State<Cooked> createState() => _CookedState();
}

class _CookedState extends State<Cooked> {
   bool isLoading = false;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cooked"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: 400,
        child: FutureBuilder(
          future: DatabaseHelper.instance.getCookedRecipe(),
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
                                        // "Ingradients:  ${countIngradients(recipe.ingredients)}",
                                        "Ingradients",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        // "Directions:  ${countDirections(recipe.directions)}",
                                        "Directions",
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
                                DatabaseHelper.instance.deleteCookedItem(recipe.id);
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