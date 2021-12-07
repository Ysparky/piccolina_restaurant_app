import 'package:dio/dio.dart';
import 'package:piccolina_restaurant_app/core/models/categories.dart';
import 'package:piccolina_restaurant_app/core/utils/constants.dart';
import 'package:rxdart/rxdart.dart';

class CategoryService {
  CategoryService() {
    categories = BehaviorSubject<List<Categories>>.seeded(null);
  }

  final _dio = Dio();
  final _endpoint = '$baseUrl/categories/';
  // final _prefs = SharedPrefs();

  BehaviorSubject<List<Categories>> categories;

  Future<void> getCategories() async {
    try {
      final response = await _dio.get(_endpoint);

      final _categories = List<Categories>.from(
        response.data.map(
          (x) => Categories.fromJson(x),
        ),
      );
      categories.add([..._categories]);
    } catch (e) {
      print(e);
    }
  }
}
