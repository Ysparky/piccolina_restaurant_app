import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:piccolina_restaurant_app/core/services/api_response.dart';
import 'package:piccolina_restaurant_app/core/services/product_service.dart';

class CatalogueViewModel extends BaseViewModel {
  CatalogueViewModel() {
    // getProducts();
  }

  final productService = inject<ProductService>();

  Stream<ApiResponse<List<Products>>> get products => productService.products;

  void toLogin() => scaffoldKey.currentContext.router.push(const LoginRoute());

  void toDetail() =>
      scaffoldKey.currentContext.router.push(const ProductDetailRoute());

  Future<void> getProducts() async {
    setLoading(newValue: true);
    await productService.getProducts();
    setLoading(newValue: false);
    notifyListeners();
  }
}
