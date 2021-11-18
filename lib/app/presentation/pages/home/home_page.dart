import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        OrderRoute(),
        CatalogueRoute(),
        FavoritesRoute(),
      ],
      extendBodyBehindAppBar: true,
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFF3131),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
          child: SalomonBottomBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.shopping_bag_outlined),
                title: const Text('Pedidos'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.home_outlined),
                title: const Text('Home'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_border_rounded),
                title: const Text('Favoritos'),
              ),
            ],
          ),
        );
      },
    );
  }
}
