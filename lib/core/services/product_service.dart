import 'package:dio/dio.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';
import 'package:piccolina_restaurant_app/core/utils/constants.dart';
import 'package:rxdart/rxdart.dart';

class ProductService {
  ProductService() {
    products = BehaviorSubject.seeded(null);
  }

  final _dio = Dio();
  final _endpoint = '$baseUrl/products/';

  BehaviorSubject<List<Products>> products;

  Future<void> getProducts() async {
    try {
      final params = {'category': 1};
      final response = await _dio.get(_endpoint, queryParameters: params);
      final _products = List<Products>.from(
        response.data.map(
          (x) => Products.fromJson(x),
        ),
      );
      products.add([..._products]);
    } catch (e) {
      print(e);
    }
  }
}
