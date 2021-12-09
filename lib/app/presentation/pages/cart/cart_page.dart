import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/cart/shoppin_cart_view_model.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/product-detail/product_detail_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/widgets/base_scroll_view.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
import 'package:piccolina_restaurant_app/core/models/orders.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShoppingCartViewModel(),
      child: const BaseLoadingOverlay<ShoppingCartViewModel>(
        child: ShoppingCartPageBase(),
      ),
    );
  }
}

class ShoppingCartPageBase extends StatelessWidget {
  const ShoppingCartPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<ShoppingCartViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFDFBF9),
            Color(0xFFFFF3ED),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        key: _vm.scaffoldKey,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: wp(10)),
            child: _vm.order != null
                ? OrderCart(vm: _vm)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: hp(40),
                        child: SvgPicture.asset(
                          'assets/img/undraw_empty_cart_co35.svg',
                        ),
                      ),
                      Text(
                        '¡Carrito vacío!',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 24.0,
                            ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class OrderCart extends StatelessWidget {
  const OrderCart({
    Key key,
    @required ShoppingCartViewModel vm,
  })  : _vm = vm,
        super(key: key);

  final ShoppingCartViewModel _vm;

  @override
  Widget build(BuildContext context) {
    return BaseScrollView(
      child: Column(
        children: [
          SizedBox(height: hp(3)),
          SizedBox(
            height: hp(61),
            child: Center(
              child: Scrollbar(
                child: BaseScrollView(
                  child: Column(
                    children: [
                      ..._vm.order.items
                          .asMap()
                          .entries
                          .map(
                            (entry) => ProductCartItem(
                              cartItem: entry.value,
                              index: entry.key,
                            ),
                          )
                          .toList()
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
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
              PricingRow(
                  price: _vm.order != null ? _vm.order.totalPrice : '--'),
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
              PricingRow(price: _vm.order.totalPrice),
            ],
          ),
          SizedBox(height: hp(2)),
          RawMaterialButton(
            onPressed: _vm.checkout,
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
              'Checkout',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(height: hp(3))
        ],
      ),
    );
  }
}

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({
    Key key,
    @required this.cartItem,
    @required this.index,
  }) : super(key: key);

  final Item cartItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<ShoppingCartViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: hp(1)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: wp(0)),
              child: Image.network(
                cartItem.product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: wp(5)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                SizedBox(height: hp(1.5)),
                Text(_vm.getIngredients(cartItem.product.ingredients)),
                SizedBox(height: hp(1.5)),
                PricingRow(price: cartItem.totalPrice),
                SizedBox(height: hp(1.5)),
                Row(
                  children: [
                    SizedBox(
                      height: hp(5),
                      width: wp(5),
                      child: MaterialButton(
                        onPressed: () => _vm.remove(index),
                        padding: EdgeInsets.zero,
                        color: const Color(0xFFFFA001),
                        textColor: Colors.white,
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.remove,
                          size: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: wp(2)),
                    Text(
                      cartItem.quantity.toString(),
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(width: wp(2)),
                    SizedBox(
                      height: hp(5),
                      width: wp(5),
                      child: MaterialButton(
                        onPressed: () => _vm.add(index),
                        padding: EdgeInsets.zero,
                        color: const Color(0xFFFFA001),
                        textColor: Colors.white,
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.add,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
