import 'package:dio/dio.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';
import 'package:piccolina_restaurant_app/core/services/api_response.dart';
import 'package:rxdart/rxdart.dart';

class ProductService {
  ProductService() {
    products = BehaviorSubject.seeded(ApiResponse.loading('Loading'));
  }

  final _dio = Dio();

  BehaviorSubject<ApiResponse<List<Products>>> products;

  Future<void> getProducts() async {
    final params = {'category': 1};
    print('asdasddas');
    final response = await _dio.get<dynamic>(
      'http://10.0.2.2:5001/api/products/?category=1',
      // queryParameters: params,
    );

    print(response);
    // if (response.data != null) {
    //   final _products = List<Products>.from(
    //     response.data.map<Products>((e) => Products.fromJson(e)),
    //   );
    //   products.add(ApiResponse.completed(_products));
    // } else {
    //   products
    //       .add(ApiResponse.error(response.statusMessage, response.statusCode));
    // }
  }
}
