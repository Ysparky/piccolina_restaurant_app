// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    @required this.id,
    @required this.email,
    @required this.fullName,
    @required this.imageUrl,
    @required this.phone,
    @required this.token,
  });

  final int id;
  final String email;
  final String fullName;
  final String imageUrl;
  final dynamic phone;
  final String token;

  LoginResponse copyWith({
    int id,
    String email,
    String fullName,
    String imageUrl,
    dynamic phone,
    String token,
  }) =>
      LoginResponse(
        id: id ?? this.id,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        imageUrl: imageUrl ?? this.imageUrl,
        phone: phone ?? this.phone,
        token: token ?? this.token,
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["id"],
        email: json["email"],
        fullName: json["fullName"],
        imageUrl: json["imageUrl"],
        phone: json["phone"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullName": fullName,
        "imageUrl": imageUrl,
        "phone": phone,
        "token": token,
      };
}
