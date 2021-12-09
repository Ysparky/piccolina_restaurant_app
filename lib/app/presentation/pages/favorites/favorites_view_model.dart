import 'package:auto_route/auto_route.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/models/login_response.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:piccolina_restaurant_app/core/services/auth_service.dart';

class ProfileVIewModel extends BaseViewModel {
  ProfileVIewModel();

  final authService = inject<AuthService>();

  LoginResponse get session => authService.userSession?.value;

  Stream<LoginResponse> get sessionStream => authService.userSession;

  bool get activeSession => session != null;

  String get imageUrl => activeSession
      ? session.imageUrl
      : 'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png';

  void toLogin() => ExtendedNavigator.root.push(Routes.loginPage);

  void logout() {
    authService.logout();
    notifyListeners();
  }
}
