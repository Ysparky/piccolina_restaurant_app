import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/cart/shoppin_cart_view_model.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/product-detail/product_detail_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/widgets/base_scroll_view.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wp(10)),
                child: Column(
                  children: [
                    SizedBox(height: hp(3)),
                    SizedBox(
                      height: hp(61),
                      child: Center(
                        child: Scrollbar(
                          child: BaseScrollView(
                            child: Column(
                              children: const [
                                ProductCartItem(),
                                ProductCartItem(),
                                ProductCartItem(),
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
                        const PricingRow(),
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
                        const PricingRow(),
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
              ),
              if (_vm.show)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  height: hp(100),
                  width: double.infinity,
                )
              else
                Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: hp(1)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: wp(0)),
              child: Image.network(
                'https://pizza2go.online/wp-content/uploads/2020/06/pepperoni.png',
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
                  'Pepperoni',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                SizedBox(height: hp(1.5)),
                const Text('Aceituna, Lechuga'),
                SizedBox(height: hp(1.5)),
                const PricingRow(),
                SizedBox(height: hp(1.5)),
                Row(
                  children: [
                    SizedBox(
                      height: hp(5),
                      width: wp(5),
                      child: MaterialButton(
                        onPressed: () {},
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
                      '3',
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
                        onPressed: () {},
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
