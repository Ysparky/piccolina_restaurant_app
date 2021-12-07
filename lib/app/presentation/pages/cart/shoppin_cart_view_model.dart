import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/product-detail/product_detail_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/widgets/base_scroll_view.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';

class ShoppingCartViewModel extends BaseViewModel {
  bool _show = false;
  bool get show => _show;

  void checkout() {
    // _show = true;
    _showModalBottomSheet();
    notifyListeners();
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
                  SizedBox(height: hp(5)),
                  Center(
                    child: RawMaterialButton(
                      onPressed: () {},
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

  @override
  void dispose() {
    _show = false;
    super.dispose();
  }
}
