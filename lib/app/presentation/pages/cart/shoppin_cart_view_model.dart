import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/product-detail/product_detail_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/widgets/base_scroll_view.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/models/orders.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:piccolina_restaurant_app/core/services/order_service.dart';
import 'package:piccolina_restaurant_app/core/utils/shared_prefs.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';

class ShoppingCartViewModel extends BaseViewModel {
  ShoppingCartViewModel();

  final orderService = inject<OrderService>();
  final _prefs = SharedPrefs();

  Orders get order => orderService.order.value;

  void checkout() {
    // _show = true;
    _showModalBottomSheet();
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

  void add(int idx) {
    var _order = orderService.order.value;
    final currentQty = _order.items[idx].quantity;
    _order.items[idx] = _order.items[idx].copyWith(
      quantity: currentQty + 1,
      totalPrice: (double.parse(_order.items[idx].totalPrice) +
              double.parse(_order.items[idx].product.price))
          .toStringAsFixed(2),
    );
    orderService.order.add(
      _order.copyWith(
        items: _order.items,
        totalPrice: _calculateTotalPrice(_order.items),
      ),
    );
    notifyListeners();
  }

  void remove(int idx) {
    var _order = orderService.order.value;
    final currentQty = _order.items[idx].quantity;
    if (currentQty == 1) {
      _order.items.removeAt(idx);
      if (_order.items.isNotEmpty) {
        orderService.order.add(
          _order.copyWith(
            items: _order.items,
            totalPrice: _calculateTotalPrice(_order.items),
          ),
        );
      } else {
        orderService.order.add(null);
      }
    } else {
      _order.items[idx] = _order.items[idx].copyWith(
        quantity: currentQty - 1,
        totalPrice: (double.parse(_order.items[idx].totalPrice) -
                double.parse(_order.items[idx].product.price))
            .toStringAsFixed(2),
      );
      orderService.order.add(
        _order.copyWith(
          items: _order.items,
          totalPrice: _calculateTotalPrice(_order.items),
        ),
      );
    }
    notifyListeners();
  }

  String _calculateTotalPrice(List<Item> items) {
    var totalPrice = 0.00;
    items.forEach((element) {
      totalPrice += double.parse(element.totalPrice);
    });

    return totalPrice.toStringAsFixed(2);
  }

  Future<void> _createOrder() async {
    final token = _prefs.token;

    if (token == null) {
      ExtendedNavigator.root.pop();
      showSnackBar(
        '¡Debes iniciar sesión!',
        actionLabel: 'Ir',
        duration: Duration(seconds: 2),
        onPressed: () => ExtendedNavigator.root.push(Routes.loginPage),
      );
    } else {
      final created = await orderService.createOrder(order);
      ExtendedNavigator.root.pop();
      if (created) {
        orderService.order.add(null);
        notifyListeners();
        showSnackBar('El restaurante ha tomado tu pedido!');
      } else {
        showSnackBar('Ocurrió un error a la hora de realizar el pedido.');
      }
    }
  }

  Future<void> _showModalBottomSheet() async {
    await showModalBottomSheet<void>(
      context: scaffoldKey.currentContext,
      builder: (context) {
        return SafeArea(
          child: BaseScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: wp(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: hp(5)),
                  Text(
                    'Método de Pago',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: const Color(0xFF555674),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  SizedBox(height: hp(1)),
                  Row(
                    children: [
                      const Icon(
                        Icons.credit_card,
                        size: 36,
                      ),
                      SizedBox(width: wp(5)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tarjeta de Crédito',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: const Color(0xFF555674),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                          Text(
                            '****49584736',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: const Color(0xFF555674),
                                      fontSize: 12,
                                    ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        minWidth: wp(10),
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        color: const Color(0xFFFFA001),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: hp(2)),
                  Text(
                    'Dirección de Envío',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: const Color(0xFF555674),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  SizedBox(height: hp(1)),
                  Row(
                    children: [
                      const Icon(
                        Icons.credit_card,
                        size: 36,
                      ),
                      SizedBox(width: wp(5)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: const Color(0xFF555674),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                          Text(
                            'Urb. Los Huertos de Pro, Comas',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: const Color(0xFF555674),
                                      fontSize: 12,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: hp(5)),
                  Row(
                    children: [
                      Text(
                        'Subtotal',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: const Color(0xFF556574),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                      ),
                      const Spacer(),
                      PricingRow(price: order.totalPrice),
                    ],
                  ),
                  Divider(
                    color: const Color(0xFF556574),
                    thickness: hp(0.2),
                  ),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: const Color(0xFF556574),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                      ),
                      const Spacer(),
                      PricingRow(price: order.totalPrice),
                    ],
                  ),
                  SizedBox(height: hp(5)),
                  Center(
                    child: RawMaterialButton(
                      onPressed: _createOrder,
                      elevation: 5,
                      fillColor: const Color(0xFFF19127),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: wp(5),
                        vertical: hp(1.5),
                      ),
                      child: Text(
                        'Order',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: hp(5)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
