import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';

class ProductDetailViewModel extends BaseViewModel {
  ProductDetailViewModel();

  void exitPage() => ExtendedNavigator.root.pop();
}
