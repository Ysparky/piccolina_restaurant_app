import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:piccolina_restaurant_app/core/models/orders.dart';
import 'package:piccolina_restaurant_app/core/utils/constants.dart';
import 'package:rxdart/rxdart.dart';

class OrderService {
  OrderService() {
    order = BehaviorSubject.seeded(null);
  }
  BehaviorSubject<Orders> order;

  final _dio = Dio();
  final _endpoint = '$baseUrl/orders/';
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6IkNVU1RPTUVSIiwic3ViSWQiOjEsImlhdCI6MTYzODk5MjQ5NiwiZXhwIjoxNjM5ODU2NDk2fQ.j8j1EsdAkIK_vzPodTW1mULIRUnNCctDb1XK-8CKSrM';

  Future<bool> createOrder(Orders order) async {
    final body = {
      "location": 1,
      "details": List<dynamic>.from(
        order.items.map(
          (x) => x.toJson(),
        ),
      ),
    };

    _dio.options.headers["Authorization"] = "Bearer $token";
    final response = await _dio.post(
      _endpoint,
      data: json.encode(body),
    );
    return response.statusCode == 201;
  }
}
