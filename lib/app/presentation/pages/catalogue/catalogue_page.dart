import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/catalogue/catalogue_view_model.dart';
import 'package:piccolina_restaurant_app/app/presentation/widgets/global_widgets.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CatalogueViewModel(),
      child: const BaseLoadingOverlay<CatalogueViewModel>(
        child: CataloguePageBase(),
      ),
    );
  }
}

class CataloguePageBase extends StatelessWidget {
  const CataloguePageBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<CatalogueViewModel>(context);
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
          child: BaseScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: hp(100) -
                    kBottomNavigationBarHeight -
                    MediaQuery.of(context).padding.top,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: wp(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: hp(3)),
                    const CatalogueHeader(),
                    SizedBox(height: hp(3)),
                    // TODO(kldas): Buscador de productos
                    const CategoriesMenuWidget(),
                    SizedBox(height: hp(3)),
                    Text(
                      'Popular',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                    ),
                    SizedBox(height: hp(2)),
                    Column(
                      children: const [
                        MenuItem(),
                        MenuItem(),
                        MenuItem(),
                        MenuItem(),
                        MenuItem(),
                        MenuItem(),
                      ],
                    ),
                    SizedBox(height: hp(10))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: hp(1)),
      child: MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          height: hp(13),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: wp(3),
            vertical: hp(1),
          ),
          child: Row(
            children: [
              SizedBox(
                width: wp(30),
                height: hp(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://assets.dominos.com.mx/dev/webOptimized/especialidad/CF/CF.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(width: wp(3)),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Spicy mozarella italiano pizza',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'S/.18.99',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                        ),
                        Text(
                          '4 min',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesMenuWidget extends StatelessWidget {
  const CategoriesMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: wp(5),
        vertical: hp(1),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFF3131),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categorías',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Ver más   >',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                ),
              )
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: hp(10),
            child: ListView.builder(
              itemCount: 5,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: wp(1),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.local_pizza_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(height: hp(1)),
                      Text(
                        'Pizzas',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogueHeader extends StatelessWidget {
  const CatalogueHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
            ),
            Text(
              'Bienvenido, Giancarlo!',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 14,
                  ),
            ),
          ],
        ),
        const Spacer(),
        ClipOval(
          child: Container(
            width: 51,
            height: 51,
            color: Colors.white,
            child: Image.network(
              'https://i.pinimg.com/750x/02/93/84/029384410a11c0aa8f671fcecbd8393b.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
