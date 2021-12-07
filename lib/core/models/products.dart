// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<Products> productsFromJson(String str) =>
//     List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));
// List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

// String productsToJson(List<Products> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.cookingTime,
    this.rating,
    this.flag,
    // this.ingredients,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: int.parse(json['id'].toString()),
        name: json['name'].toString(),
        description: json['description'].toString(),
        price: json['price'].toString(),
        imageUrl: json['imageUrl'].toString(),
        cookingTime: json['cookingTime'].toString(),
        rating: json['rating'].toString(),
        flag: json['flag'] == 'true',
        // ingredients: List<dynamic>.from(json['ingredients'].map((x) => x)),
      );

  final int id;
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final String cookingTime;
  final String rating;
  final bool flag;
  // final List<dynamic> ingredients;

  Products copyWith({
    int id,
    String name,
    String description,
    String price,
    String imageUrl,
    String cookingTime,
    String rating,
    bool flag,
    // List<dynamic> ingredients,
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
        // ingredients: ingredients ?? this.ingredients,
      );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'description': description,
  //       'price': price,
  //       'imageUrl': imageUrl,
  //       'cookingTime': cookingTime,
  //       'rating': rating,
  //       'flag': flag,
  //       // 'ingredients': List<dynamic>.from(ingredients.map((x) => x)),
  //     };
}
