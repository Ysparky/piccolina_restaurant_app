import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/pages/catalog/favorite.dart';
import 'package:piccolina_restaurant_app/pages/catalog/home.dart';
import 'package:piccolina_restaurant_app/pages/catalog/order.dart';

class VisualizarCatalogo extends StatefulWidget {
  const VisualizarCatalogo({Key? key}) : super(key: key);

  @override
  _VisualizarCatalogoState createState() => _VisualizarCatalogoState();
}

class _VisualizarCatalogoState extends State<VisualizarCatalogo> {
  int index = 1;
  final screen = [
    OrderCatalogPage(),
    HomeCatalogPage(),
    FavoriteCatalogPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.shopping_bag_outlined,
        size: 30,
      ),
      Icon(
        Icons.home_outlined,
        size: 30,
      ),
      Icon(
        Icons.favorite_border_rounded,
        size: 30,
      ),
    ];
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: screen[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.grey),
          ),
          child: CurvedNavigationBar(
            height: 70,
            buttonBackgroundColor: Colors.white,
            color: Colors.white,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.ease,
            animationDuration: const Duration(milliseconds: 600),
            index: index,
            items: items,
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
      ),
    );
  }
}
