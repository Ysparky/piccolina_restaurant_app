import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:piccolina_restaurant_app/core/models/orders.dart';
import 'package:piccolina_restaurant_app/core/utils/constants.dart';
import 'package:piccolina_restaurant_app/core/utils/shared_prefs.dart';
import 'package:rxdart/rxdart.dart';

class OrderService {
  OrderService() {
    order = BehaviorSubject.seeded(null);
    ongoingOrders = BehaviorSubject.seeded(null);
    pastOrders = BehaviorSubject.seeded(null);
    orders = BehaviorSubject.seeded(null);
  }

  BehaviorSubject<Orders> order;
  BehaviorSubject<List<Orders>> ongoingOrders;
  BehaviorSubject<List<Orders>> pastOrders;
  BehaviorSubject<List<Orders>> orders;

  final _dio = Dio();
  final _endpoint = '$baseUrl/orders/';

  final _prefs = SharedPrefs();

  String get token => _prefs.token;

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

  Future<void> getOrders() async {
    try {
      _dio.options.headers["Authorization"] = "Bearer $token";
      final response = await _dio.get(_endpoint);

      if (response.statusCode == 200) {
        final _orders = List<Orders>.from(
          response.data.map(
            (x) => Orders.fromJson(x),
          ),
        );
        orders.add([..._orders]);
      }
    } catch (e) {
      print(e);
    }
  }
}
