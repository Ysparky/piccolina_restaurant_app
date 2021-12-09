// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:piccolina_restaurant_app/core/models/products.dart';

List<Orders> ordersFromJson(String str) =>
    List<Orders>.from(json.decode(str).map((x) => Orders.fromJson(x)));

String ordersToJson(List<Orders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
  Orders({
    this.id,
    @required this.totalPrice,
    this.flag = true,
    @required this.items,
    this.statusLog,
  });

  final int id;
  final String totalPrice;
  final bool flag;
  final List<Item> items;
  final List<StatusLog> statusLog;

  Orders copyWith({
    int id,
    String totalPrice,
    bool flag,
    List<Item> items,
    List<StatusLog> statusLog,
  }) =>
      Orders(
        id: id ?? this.id,
        totalPrice: totalPrice ?? this.totalPrice,
        flag: flag ?? this.flag,
        items: items ?? this.items,
        statusLog: statusLog ?? this.statusLog,
      );

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["id"],
        totalPrice: json["totalPrice"],
        flag: json["flag"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        statusLog: List<StatusLog>.from(
            json["statusLog"].map((x) => StatusLog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPrice": totalPrice,
        "flag": flag,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    @required this.quantity,
    @required this.totalPrice,
    @required this.product,
  });

  final int id;
  final int quantity;
  final String totalPrice;
  final Products product;

  Item copyWith({
    int id,
    int quantity,
    String totalPrice,
    Products product,
  }) =>
      Item(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        totalPrice: totalPrice ?? this.totalPrice,
        product: product ?? this.product,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        quantity: json["quantity"],
        totalPrice: json["totalPrice"],
        product: Products.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product": product.id,
      };
}

class StatusLog {
  StatusLog({
    @required this.id,
    @required this.status,
    @required this.createdAt,
  });

  final int id;
  final String status;
  final DateTime createdAt;

  StatusLog copyWith({
    int id,
    String status,
    DateTime createdAt,
  }) =>
      StatusLog(
        id: id ?? this.id,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );

  factory StatusLog.fromJson(Map<String, dynamic> json) => StatusLog(
        id: json["id"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
      };
}
