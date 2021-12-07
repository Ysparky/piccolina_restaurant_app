// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';
import 'package:meta/meta.dart';

List<Categories> categoriesFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  Categories({
    @required this.id,
    @required this.name,
    @required this.flag,
  });

  final int id;
  final String name;
  final bool flag;

  Categories copyWith({
    int id,
    String name,
    bool flag,
  }) =>
      Categories(
        id: id ?? this.id,
        name: name ?? this.name,
        flag: flag ?? this.flag,
      );

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json['id'],
        name: json['name'],
        flag: json['flag'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'flag': flag,
      };
}
