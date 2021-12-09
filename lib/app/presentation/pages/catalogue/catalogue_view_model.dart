import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/models/categories.dart';
import 'package:piccolina_restaurant_app/core/models/login_response.dart';
import 'package:piccolina_restaurant_app/core/models/orders.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:piccolina_restaurant_app/core/services/auth_service.dart';
import 'package:piccolina_restaurant_app/core/services/category_service.dart';
import 'package:piccolina_restaurant_app/core/services/order_service.dart';
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
  final orderService = inject<OrderService>();

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

  void addToCart(Products product) {
    final quantity = 1;
    if (orderService.order.value != null) {
      // existing order case
      // validate if exists
      final order = orderService.order.value;
      final idx =
          order.items.indexWhere((element) => element.product.id == product.id);
      if (idx != -1) {
        // exists
        final item = order.items[idx];
        final productPrice = quantity * double.parse(product.price);
        final totalProductPrice = productPrice + double.parse(item.totalPrice);
        final totalPriceAsString = totalProductPrice.toStringAsFixed(2);
        order.items[idx] = Item(
          quantity: item.quantity + quantity,
          totalPrice: totalPriceAsString,
          product: product,
        );
        final totalOrderPrice = double.parse(order.totalPrice) + productPrice;
        orderService.order.add(
          order.copyWith(
            items: order.items,
            totalPrice: totalOrderPrice.toStringAsFixed(2),
          ),
        );
      } else {
        // does not exists
        final order = orderService.order.value;
        final totalPrice = quantity * double.parse(product.price);
        final totalPriceAsString = totalPrice.toStringAsFixed(2);
        final newItem = Item(
          quantity: quantity,
          totalPrice: totalPriceAsString,
          product: product,
        );
        order.items.add(newItem);
        final orderTotalPrice = (double.parse(order.totalPrice) + totalPrice);
        orderService.order.add(
          order.copyWith(
            items: order.items,
            totalPrice: orderTotalPrice.toStringAsFixed(2),
          ),
        );
      }
    } else {
      // create new order
      final totalPrice = quantity * double.parse(product.price);
      final totalPriceAsString = totalPrice.toStringAsFixed(2);
      final newItem = Item(
        quantity: quantity,
        totalPrice: totalPriceAsString,
        product: product,
      );
      final order = new Orders(
        totalPrice: totalPriceAsString,
        items: [newItem],
      );
      orderService.order.add(order);
    }
    showSnackBar('$quantity ${product.name} agregada al carrito');
  }
}
