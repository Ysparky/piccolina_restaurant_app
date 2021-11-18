import 'package:auto_route/annotations.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/catalogue/catalogue_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/favorites/favorites_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/home/home_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/login/login_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/order/order_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/registration/registration_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<void>(
      path: '/home',
      page: HomePage,
      initial: true,
      children: [
        AutoRoute<void>(path: 'orders', page: OrderPage),
        AutoRoute<void>(path: 'catalogue', page: CataloguePage, initial: true),
        AutoRoute<void>(path: 'favorites', page: FavoritesPage),
      ],
    ),
    AutoRoute<void>(path: '/login-page', page: LoginPage),
    AutoRoute<void>(path: '/registration-page', page: RegistrationPage)
  ],
)
class $AppRouter {}
