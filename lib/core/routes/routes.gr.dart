// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../app/presentation/pages/cart/cart_page.dart' as _i7;
import '../../app/presentation/pages/catalogue/catalogue_page.dart' as _i6;
import '../../app/presentation/pages/favorites/favorites_page.dart' as _i8;
import '../../app/presentation/pages/home/home_page.dart' as _i2;
import '../../app/presentation/pages/login/login_page.dart' as _i4;
import '../../app/presentation/pages/product-detail/product_detail_page.dart'
    as _i3;
import '../../app/presentation/pages/registration/registration_page.dart'
    as _i5;
import '../../app/presentation/pages/splash/splash_page.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i2.HomePage());
    },
    ProductDetailRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i3.ProductDetailPage());
    },
    LoginRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i4.LoginPage());
    },
    RegistrationRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i5.RegistrationPage());
    },
    CatalogueRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i6.CataloguePage());
    },
    ShoppingCartRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i7.ShoppingCartPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i8.FavoritesPage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashRoute.name, path: '/'),
        _i9.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i9.RouteConfig('#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'catalogue',
              fullMatch: true),
          _i9.RouteConfig(CatalogueRoute.name,
              path: 'catalogue', parent: HomeRoute.name),
          _i9.RouteConfig(ShoppingCartRoute.name,
              path: 'shopping-cart', parent: HomeRoute.name),
          _i9.RouteConfig(FavoritesRoute.name,
              path: 'favorites', parent: HomeRoute.name)
        ]),
        _i9.RouteConfig(ProductDetailRoute.name, path: '/product-detail'),
        _i9.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i9.RouteConfig(RegistrationRoute.name, path: '/registration-page')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for [_i3.ProductDetailPage]
class ProductDetailRoute extends _i9.PageRouteInfo<void> {
  const ProductDetailRoute() : super(name, path: '/product-detail');

  static const String name = 'ProductDetailRoute';
}

/// generated route for [_i4.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for [_i5.RegistrationPage]
class RegistrationRoute extends _i9.PageRouteInfo<void> {
  const RegistrationRoute() : super(name, path: '/registration-page');

  static const String name = 'RegistrationRoute';
}

/// generated route for [_i6.CataloguePage]
class CatalogueRoute extends _i9.PageRouteInfo<void> {
  const CatalogueRoute() : super(name, path: 'catalogue');

  static const String name = 'CatalogueRoute';
}

/// generated route for [_i7.ShoppingCartPage]
class ShoppingCartRoute extends _i9.PageRouteInfo<void> {
  const ShoppingCartRoute() : super(name, path: 'shopping-cart');

  static const String name = 'ShoppingCartRoute';
}

/// generated route for [_i8.FavoritesPage]
class FavoritesRoute extends _i9.PageRouteInfo<void> {
  const FavoritesRoute() : super(name, path: 'favorites');

  static const String name = 'FavoritesRoute';
}
