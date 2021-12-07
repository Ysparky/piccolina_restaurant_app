import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/models/categories.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:piccolina_restaurant_app/core/services/category_service.dart';
import 'package:piccolina_restaurant_app/core/services/product_service.dart';

class CatalogueViewModel extends BaseViewModel {
  CatalogueViewModel() {
    getCategories();
    getProducts();
  }

  final productService = inject<ProductService>();
  final categoryService = inject<CategoryService>();

  Stream<List<Products>> get products => productService.products;
  Stream<List<Categories>> get categories => categoryService.categories;

  void toLogin() => ExtendedNavigator.root.push(Routes.loginPage);

  void toDetail(Products product) => ExtendedNavigator.root.push(
        Routes.productDetailPage,
        arguments: ProductDetailPageArguments(product: product),
      );

  Future<void> getCategories() async {
    setLoading(newValue: true);
    await categoryService.getCategories();
    setLoading(newValue: false);
    notifyListeners();
  }

  Future<void> getProducts() async {
    setLoading(newValue: true);
    await productService.getProducts();
    setLoading(newValue: false);
    notifyListeners();
  }

  String getIngredients(List<Ingredient> ingredients) {
    var ing = '';
    for (var i = 0; i < ingredients.length; i++) {
      if (i == 0) {
        ing = ingredients[i].name;
      } else if (i > 0) {
        ing += ', ${ingredients[i].name.toLowerCase()}';
      }
    }

    return ing;
  }
}
