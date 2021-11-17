// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../app/presentation/pages/home/home_page.dart' as _i2;
import '../../app/presentation/pages/login/login_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LoginPageRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    HomePageRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(LoginPageRoute.name, path: '/'),
        _i3.RouteConfig(HomePageRoute.name, path: '/home-page')
      ];
}

/// generated route for [_i1.LoginPage]
class LoginPageRoute extends _i3.PageRouteInfo<void> {
  const LoginPageRoute() : super(name, path: '/');

  static const String name = 'LoginPageRoute';
}

/// generated route for [_i2.HomePage]
class HomePageRoute extends _i3.PageRouteInfo<void> {
  const HomePageRoute() : super(name, path: '/home-page');

  static const String name = 'HomePageRoute';
}
