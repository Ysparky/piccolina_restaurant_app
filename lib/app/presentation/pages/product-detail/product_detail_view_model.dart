import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/models/products.dart';

class ProductDetailViewModel extends BaseViewModel {
  ProductDetailViewModel({@required this.product});

  final Products product;

  void exitPage() => ExtendedNavigator.root.pop();

  String getIngredients(List<Ingredient> ingredients) {
    var ing = '';
    for (var i = 0; i < ingredients.length; i++) {
      if (i == 0) {
        ing = ingredients[i].name;
      } else if (i > 0) {
        ing += ', ${ingredients[i].name.toLowerCase()}';
      }
    }

    return ing;
  }
}
