import 'dart:convert';

RecipeModel recipeModelFromJson(String str) => RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());
class RecipeModel{

RecipeModel({
 this.id,
 this.title,
 this.image,
 this.ingredients,
 this.directions,
 this.youtubeUrl
});

int? id;
String?title;
String?image;
String?ingredients;
String?directions;
String?youtubeUrl; 

factory RecipeModel.fromJson(Map<String,dynamic>json)=>RecipeModel(

id: json["id"],
title: json["title"],
image: json["image"],
ingredients: json["ingredients"],
directions: json["directions"],
youtubeUrl: json["youtubeUrl"]

);

Map<String,dynamic>toJson()=>{
  "id":id,
  "title":title,
  "image":image,
  "ingredients":ingredients,
  "directions":directions
};

static fromMap(Map<String,Object?>data){}

}