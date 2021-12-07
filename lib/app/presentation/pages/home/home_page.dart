import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/cart/cart_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/catalogue/catalogue_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SizedBox.expand(
        child: PageView(
          children: const [
            CataloguePage(),
            ShoppingCartPage(),
            // ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Carrito'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Perfil'),
          ),
        ],
      ),
    );
    // return AutoTabsScaffold(
    //   routes: const [
    //     CatalogueRoute(),
    //     ShoppingCartRoute(),
    //     FavoritesRoute(),
    //   ],
    //   extendBodyBehindAppBar: true,
    //   bottomNavigationBuilder: (_, tabsRouter) {
    //     return Container(
    //       decoration: const BoxDecoration(
    //         color: Color(0xFFFF3131),
    //         borderRadius: BorderRadius.vertical(
    //           top: Radius.circular(15),
    //         ),
    //       ),
    //       child: SalomonBottomBar(
    //         currentIndex: tabsRouter.activeIndex,
    //         onTap: tabsRouter.setActiveIndex,
    //         selectedItemColor: Colors.white,
    //         unselectedItemColor: Colors.white,
    //         items: [
    //           SalomonBottomBarItem(
    //             icon: const Icon(Icons.shopping_bag_outlined),
    //             title: const Text('Pedidos'),
    //           ),
    //           SalomonBottomBarItem(
    //             icon: const Icon(Icons.home_outlined),
    //             title: const Text('Home'),
    //           ),
    //           SalomonBottomBarItem(
    //             icon: const Icon(Icons.favorite_border_rounded),
    //             title: const Text('Favoritos'),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
