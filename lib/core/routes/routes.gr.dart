// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../app/presentation/pages/catalogue/catalogue_page.dart' as _i6;
import '../../app/presentation/pages/favorites/favorites_page.dart' as _i7;
import '../../app/presentation/pages/home/home_page.dart' as _i2;
import '../../app/presentation/pages/login/login_page.dart' as _i3;
import '../../app/presentation/pages/order/order_page.dart' as _i5;
import '../../app/presentation/pages/registration/registration_page.dart'
    as _i4;
import '../../app/presentation/pages/splash/splash_page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<void>(
          routeData: routeData, child: const _i2.HomePage());
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<void>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    RegistrationRoute.name: (routeData) {
      return _i8.MaterialPageX<void>(
          routeData: routeData, child: const _i4.RegistrationPage());
    },
    OrderRoute.name: (routeData) {
      return _i8.MaterialPageX<void>(
          routeData: routeData, child: const _i5.OrderPage());
    },
    CatalogueRoute.name: (routeData) {
      return _i8.MaterialPageX<void>(
          routeData: routeData, child: const _i6.CataloguePage());
    },
    FavoritesRoute.name: (routeData) {
      return _i8.MaterialPageX<void>(
          routeData: routeData, child: const _i7.FavoritesPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i8.RouteConfig('#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'catalogue',
              fullMatch: true),
          _i8.RouteConfig(OrderRoute.name,
              path: 'orders', parent: HomeRoute.name),
          _i8.RouteConfig(CatalogueRoute.name,
              path: 'catalogue', parent: HomeRoute.name),
          _i8.RouteConfig(FavoritesRoute.name,
              path: 'favorites', parent: HomeRoute.name)
        ]),
        _i8.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i8.RouteConfig(RegistrationRoute.name, path: '/registration-page')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for [_i3.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for [_i4.RegistrationPage]
class RegistrationRoute extends _i8.PageRouteInfo<void> {
  const RegistrationRoute() : super(name, path: '/registration-page');

  static const String name = 'RegistrationRoute';
}

/// generated route for [_i5.OrderPage]
class OrderRoute extends _i8.PageRouteInfo<void> {
  const OrderRoute() : super(name, path: 'orders');

  static const String name = 'OrderRoute';
}

/// generated route for [_i6.CataloguePage]
class CatalogueRoute extends _i8.PageRouteInfo<void> {
  const CatalogueRoute() : super(name, path: 'catalogue');

  static const String name = 'CatalogueRoute';
}

/// generated route for [_i7.FavoritesPage]
class FavoritesRoute extends _i8.PageRouteInfo<void> {
  const FavoritesRoute() : super(name, path: 'favorites');

  static const String name = 'FavoritesRoute';
}
