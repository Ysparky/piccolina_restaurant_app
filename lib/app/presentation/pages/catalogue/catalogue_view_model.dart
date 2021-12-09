import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/models/categories.dart';
import 'package:piccolina_restaurant_app/core/models/login_response.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:piccolina_restaurant_app/core/services/auth_service.dart';
import 'package:piccolina_restaurant_app/core/services/category_service.dart';
import 'package:piccolina_restaurant_app/core/services/product_service.dart';

class CatalogueViewModel extends BaseViewModel {
  CatalogueViewModel() {
    if (categoryService.categories.value == null) getCategories();
    if (productService.products.value == null) getProducts();
    authService.loadSession();
  }

  final productService = inject<ProductService>();
  final categoryService = inject<CategoryService>();
  final authService = inject<AuthService>();

  Stream<List<Products>> get products => productService.products;
  Stream<List<Categories>> get categories => categoryService.categories;
  LoginResponse get session => authService.userSession?.value;

  String get imageUrl =>
      session?.imageUrl ??
      'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png';

  void toLogin() => ExtendedNavigator.root.push(Routes.loginPage);

  void toDetail(Products product) => ExtendedNavigator.root.push(
        Routes.productDetailPage,
        arguments: ProductDetailPageArguments(product: product),
      );

  Future<void> getCategories() async {
    setLoading(true);
    await categoryService.getCategories();
    setLoading(false);
    notifyListeners();
  }

  Future<void> getProducts() async {
    setLoading(true);
    await productService.getProducts();
    setLoading(false);
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
