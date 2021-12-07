// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/presentation/pages/cart/cart_page.dart';
import '../../app/presentation/pages/catalogue/catalogue_page.dart';
import '../../app/presentation/pages/favorites/favorites_page.dart';
import '../../app/presentation/pages/home/home_page.dart';
import '../../app/presentation/pages/login/login_page.dart';
import '../../app/presentation/pages/product-detail/product_detail_page.dart';
import '../../app/presentation/pages/registration/registration_page.dart';
import '../../app/presentation/pages/splash/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String homePage = '/home';
  static const String productDetailPage = '/product-detail';
  static const String loginPage = '/login-page';
  static const String registrationPage = '/registration-page';
  static const all = <String>{
    splashPage,
    homePage,
    productDetailPage,
    loginPage,
    registrationPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(
      Routes.homePage,
      page: HomePage,
      generator: HomePageRouter(),
    ),
    RouteDef(Routes.productDetailPage, page: ProductDetailPage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.registrationPage, page: RegistrationPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const SplashPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const HomePage(),
        settings: data,
      );
    },
    ProductDetailPage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const ProductDetailPage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const LoginPage(),
        settings: data,
      );
    },
    RegistrationPage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const RegistrationPage(),
        settings: data,
      );
    },
  };
}

class HomePageRoutes {
  static const String cataloguePage = 'catalogue';
  static const String shoppingCartPage = 'shopping-cart';
  static const String favoritesPage = 'favorites';
  static const all = <String>{
    cataloguePage,
    shoppingCartPage,
    favoritesPage,
  };
}

class HomePageRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(HomePageRoutes.cataloguePage, page: CataloguePage),
    RouteDef(HomePageRoutes.shoppingCartPage, page: ShoppingCartPage),
    RouteDef(HomePageRoutes.favoritesPage, page: FavoritesPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    CataloguePage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const CataloguePage(),
        settings: data,
      );
    },
    ShoppingCartPage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const ShoppingCartPage(),
        settings: data,
      );
    },
    FavoritesPage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const FavoritesPage(),
        settings: data,
      );
    },
  };
}
