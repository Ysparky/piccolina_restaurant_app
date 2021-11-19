import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';

class CatalogueViewModel extends BaseViewModel {
  CatalogueViewModel();

  void toLogin() => scaffoldKey.currentContext!.router.push(const LoginRoute());
}
