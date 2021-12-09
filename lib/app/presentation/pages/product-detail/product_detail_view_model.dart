import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/models/orders.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';
import 'package:piccolina_restaurant_app/core/services/order_service.dart';

class ProductDetailViewModel extends BaseViewModel {
  ProductDetailViewModel({@required this.product}) {
    _quantity = 1;
  }

  final Products product;

  final orderService = inject<OrderService>();

  var _quantity;

  int get quantity => _quantity;

  void exitPage() => ExtendedNavigator.root.pop();

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

  void add() {
    _quantity++;
    notifyListeners();
  }

  void remove() {
    _quantity > 1 ? _quantity-- : _quantity;
    notifyListeners();
  }

  void addToCart() {
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
        print(totalOrderPrice);
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
    ExtendedNavigator.root.pop();
  }
}
