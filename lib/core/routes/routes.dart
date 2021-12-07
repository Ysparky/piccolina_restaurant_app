import 'package:auto_route/annotations.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/cart/cart_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/catalogue/catalogue_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/favorites/favorites_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/home/home_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/login/login_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/product-detail/product_detail_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/registration/registration_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<void>(path: '/', initial: true, page: SplashPage),
    AutoRoute<void>(
      path: '/home',
      page: HomePage,
      children: [
        AutoRoute<void>(path: 'catalogue', page: CataloguePage, initial: true),
        AutoRoute<void>(path: 'shopping-cart', page: ShoppingCartPage),
        AutoRoute<void>(path: 'favorites', page: FavoritesPage),
      ],
    ),
    AutoRoute<void>(path: '/product-detail', page: ProductDetailPage),
    AutoRoute<void>(path: '/login-page', page: LoginPage),
    AutoRoute<void>(path: '/registration-page', page: RegistrationPage)
  ],
)
class $AppRouter {}
