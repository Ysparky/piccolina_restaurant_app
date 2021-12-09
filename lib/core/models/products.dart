// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.cookingTime,
    @required this.rating,
    @required this.flag,
    @required this.ingredients,
  });

  final int id;
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final String cookingTime;
  final String rating;
  final bool flag;
  final List<Ingredient> ingredients;

  Products copyWith({
    int id,
    String name,
    String description,
    String price,
    String imageUrl,
    String cookingTime,
    String rating,
    bool flag,
    List<Ingredient> ingredients,
  }) =>
      Products(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        cookingTime: cookingTime ?? this.cookingTime,
        rating: rating ?? this.rating,
        flag: flag ?? this.flag,
        ingredients: ingredients ?? this.ingredients,
      );

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        cookingTime: json["cookingTime"],
        rating: json["rating"],
        flag: json["flag"],
        ingredients: json["ingredients"] != null
            ? List<Ingredient>.from(
                json["ingredients"].map((x) => Ingredient.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "cookingTime": cookingTime,
        "rating": rating,
        "flag": flag,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
      };
}

class Ingredient {
  Ingredient({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.flag,
  });

  final int id;
  final String name;
  final String price;
  final bool flag;

  Ingredient copyWith({
    int id,
    String name,
    String price,
    bool flag,
  }) =>
      Ingredient(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        flag: flag ?? this.flag,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "flag": flag,
      };
}
