import 'package:auto_route/annotations.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/home/home_page.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/login/login_page.dart';

@MaterialAutoRouter(routes: [
  AdaptiveRoute(page: LoginPage, initial: true),
  AdaptiveRoute(page: HomePage)
])
class $AppRouter {}
