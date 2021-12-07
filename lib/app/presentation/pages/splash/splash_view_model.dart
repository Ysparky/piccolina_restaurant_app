import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel() {
    showLogo();
    toHome();
  }

  double _opacity = 0;
  double get opacity => _opacity;

  Future<void> showLogo() async {
    await Future<void>.delayed(const Duration(milliseconds: 20), () {
      _opacity = 1.0;
      notifyListeners();
    });
  }

  Future<void> toHome() async {
    await Future<void>.delayed(const Duration(seconds: 2), () {
      scaffoldKey.currentContext.router.popAndPush(const HomeRoute());
    });
  }
}
