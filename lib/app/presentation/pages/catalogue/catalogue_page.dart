import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/catalogue/catalogue_view_model.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
import 'package:piccolina_restaurant_app/core/models/categories.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({Key key}) : super(key: key);

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
  const CataloguePageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<CatalogueViewModel>(context);
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
          child: Column(
            children: [
              const HeaderHome(),
              const HorizontalCategoryList(),
              SizedBox(height: hp(2)),
              Expanded(
                child: StreamBuilder(
                  stream: _vm.products,
                  builder: (context, AsyncSnapshot<List<Products>> snapshot) {
                    if (snapshot.hasData) {
                      final products = snapshot.data;
                      return ListView.builder(
                        itemCount: products?.length ?? 0,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (_, index) => CatalogueProductItem(
                          product: products[index],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hp(10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Center(child: CurrentLocationHeader()),
                UserAvatar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<CatalogueViewModel>(context);
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: wp(5)),
        child: CircleAvatar(
          backgroundImage: NetworkImage(_vm.imageUrl),
        ),
      ),
    );
  }
}

class CurrentLocationHeader extends StatelessWidget {
  const CurrentLocationHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: hp(1)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ubicación Actual',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: const Color(0xFF556574),
                    fontSize: 16,
                  ),
            ),
            SizedBox(width: wp(1)),
            MaterialButton(
              onPressed: () {},
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              minWidth: wp(5),
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xFF556574),
                size: 18,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Color(0xFF556574),
              size: 18,
            ),
            Text(
              'Comas, Lima',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: const Color(0xFF556574),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        )
      ],
    );
  }
}

class CatalogueProductItem extends StatelessWidget {
  const CatalogueProductItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<CatalogueViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(1)),
      child: MaterialButton(
        onPressed: () => _vm.toDetail(product),
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: hp(1), horizontal: wp(2)),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Hero(
                    tag: product.imageUrl,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(width: wp(2)),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: hp(2)),
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                    Text(_vm.getIngredients(product.ingredients)),
                    SizedBox(height: hp(0.5)),
                    Text(
                      'S/. ${product.price.toString()}',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      color: const Color(0xFFFFA001),
                      textColor: Colors.white,
                      shape: const CircleBorder(),
                      child: const Icon(Icons.add),
                    ),
                    Text(product.cookingTime),
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

class HorizontalCategoryList extends StatelessWidget {
  const HorizontalCategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<CatalogueViewModel>(context);
    return Container(
      height: hp(5.5),
      width: double.infinity,
      margin: EdgeInsets.only(top: hp(1)),
      child: StreamBuilder(
        stream: _vm.categories,
        builder: (_, AsyncSnapshot<List<Categories>> snapshot) {
          if (snapshot.hasData) {
            final categories = snapshot.data;
            return ListView.builder(
              itemCount: categories?.length ?? 0,
              padding: EdgeInsets.only(left: wp(3), top: wp(2)),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => CategoryChip(
                category: categories[index],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    Key key,
    @required this.category,
  }) : super(key: key);

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wp(2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: MaterialButton(
          onPressed: () {},
          color: const Color(0xFFFFA001),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              category.name,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
