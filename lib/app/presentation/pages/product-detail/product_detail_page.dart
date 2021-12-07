import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/product-detail/product_detail_view_model.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailViewModel(),
      child: const BaseLoadingOverlay<ProductDetailViewModel>(
        child: ProductDetailPageBase(),
      ),
    );
  }
}

class ProductDetailPageBase extends StatelessWidget {
  const ProductDetailPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<ProductDetailViewModel>(context);
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              splashRadius: wp(5),
              icon: const Icon(
                Icons.favorite,
                color: Color(0xFFFFA001),
              ),
            ),
          ],
          leading: IconButton(
            onPressed: _vm.exitPage,
            splashRadius: wp(5),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF556574),
            ),
          ),
        ),
        body: Column(
          children: [
            const ProductImageWidget(),
            SizedBox(height: hp(2)),
            const QuantityPicker(),
            const SizePicker(),
            SizedBox(height: hp(2)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: wp(10)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pepperonni',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                            ),
                            SizedBox(height: hp(1)),
                            Text(
                              'Pepperoni, durazno, aceituna',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      const PricingRow(),
                    ],
                  ),
                  SizedBox(height: hp(1)),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFC10D),
                          ),
                          SizedBox(width: wp(2)),
                          Text(
                            '4.9',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(width: wp(7)),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_filled,
                            color: Color(0xFFF19127),
                          ),
                          SizedBox(width: wp(2)),
                          Text(
                            '2-4 min',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Text(
            //   'Nulla quis lorem ut libero malesuada feugiat. Lorem ipsum dolor '
            //   'sit amet, consectetur adipiscing elit. Curabitur aliquet quam '
            //   'id dui posuere blandit. Pellentesque in ipsum id orci porta '
            //   'dapibus. Vestibulum ante ipsum primis in faucibus orci luctus '
            //   'et ultrices posuere cubilia Curae.',
            //   style: Theme.of(context).textTheme.bodyText1.copyWith(
            //         height: hp(0.2),
            //       ),
            //   textAlign: TextAlign.justify,
            // ),
            const Spacer(),
            RawMaterialButton(
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
                'Agregar al carrito',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(height: hp(5))
          ],
        ),
      ),
    );
  }
}

class PricingRow extends StatelessWidget {
  const PricingRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'S/.',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: const Color(0xFFF19127),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
        ),
        SizedBox(width: wp(1)),
        Text(
          '20.99',
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      ],
    );
  }
}

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wp(20)),
      child: Image.network(
        'https://pizza2go.online/wp-content/uploads/2020/06/pepperoni.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class SizePicker extends StatelessWidget {
  const SizePicker({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Familiar',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF05202D).withOpacity(0.5),
                ),
          ),
        ),
        // Icon(Icons.)
        TextButton(
          onPressed: () {},
          child: Text(
            'Media Familiar',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF05202D),
                ),
          ),
        ),
      ],
    );
  }
}

class QuantityPicker extends StatelessWidget {
  const QuantityPicker({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          color: const Color(0xFFFFA001),
          textColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.remove),
        ),
        Text(
          '3',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        MaterialButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          color: const Color(0xFFFFA001),
          textColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class ProductDateilPageBase2 extends StatelessWidget {
  const ProductDateilPageBase2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<ProductDetailViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFF5F3), Color(0xFFFFEFEF)],
        ),
      ),
      child: Scaffold(
        key: _vm.scaffoldKey,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wp(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: hp(2)),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://assets.dominos.com.mx/dev/webOptimized/especialidad/CF/CF.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          right: -10,
                          child: RawMaterialButton(
                            onPressed: _vm.exitPage,
                            fillColor: Colors.white,
                            shape: const CircleBorder(),
                            elevation: 4,
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              // size: 17,
                            ),
                          ),
                        ),
                        Positioned(
                          left: -10,
                          child: RawMaterialButton(
                            onPressed: _vm.exitPage,
                            fillColor: Colors.white,
                            shape: const CircleBorder(),
                            elevation: 4,
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.red,
                              // size: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: hp(2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            'Spicy mozarella italiano pizza',
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                          ),
                        ),
                        Text(
                          'S/. 20.99',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_border_rounded,
                              color: Color(0xFFF19127),
                            ),
                            SizedBox(width: wp(2)),
                            const Text('4.9')
                          ],
                        ),
                        SizedBox(width: wp(7)),
                        Row(
                          children: [
                            const Icon(
                              Icons.timer_rounded,
                              color: Color(0xFFF19127),
                            ),
                            SizedBox(width: wp(2)),
                            const Text('4 min')
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: hp(2)),
                    Text(
                      'Descripción',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      'Nulla quis lorem ut libero malesuada feugiat. Lorem ipsum dolor '
                      'sit amet, consectetur adipiscing elit. Curabitur aliquet quam '
                      'id dui posuere blandit. Pellentesque in ipsum id orci porta '
                      'dapibus. Vestibulum ante ipsum primis in faucibus orci luctus '
                      'et ultrices posuere cubilia Curae; Donec velit neque, auctor '
                      'sit amet aliquam vel, ullamcorper sit amet ligula. Donec'
                      ' rutrum congue leo eget malesuada. Vivamus magna justo,'
                      ' lacinia eget consectetur sed, convallis at tellus.'
                      ' Vivamus suscipit tortor eget felis porttitor volutpat.'
                      ' Donec rutrum congue leo eget malesuada.'
                      ' Pellentesque in ipsum id orci porta dapibus.',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -10,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.red[200],
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(5),
                    vertical: hp(3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Cantidad',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Material(
                              color: Colors.white,
                              child: IconButton(
                                icon: const Icon(Icons.remove),
                                padding: EdgeInsets.zero,
                                splashRadius: 18,
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(width: wp(2)),
                          const Text('0'),
                          SizedBox(width: wp(2)),
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Material(
                              color: Colors.white,
                              child: IconButton(
                                icon: const Icon(Icons.add),
                                padding: EdgeInsets.zero,
                                splashRadius: 18,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: hp(2)),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red.withOpacity(0.9),
                            // elevation: 2,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          child: Text(
                            'Agregar al carrito',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
