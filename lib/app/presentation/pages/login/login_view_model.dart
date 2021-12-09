import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:piccolina_restaurant_app/core/services/auth_service.dart';
import 'package:piccolina_restaurant_app/core/utils/validators.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel();

  final _authService = inject<AuthService>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get loginKey => _loginKey;

  String emailValidator(String value) => value.isEmpty
      ? 'El correo no puede estar vacío'
      : !isValidEmail(value)
          ? 'Ingrese un correo con formato válido'
          : null;

  String passwordValidator(String value) =>
      value.isNotEmpty ? null : 'La contraseña no puede estar vacía';

  void validate() {
    final _isValid = _loginKey.currentState.validate();
    if (_isValid) {
      _login();
    } else {
      showSnackBar(
        '¡Verifique que no tenga errores!',
        duration: const Duration(milliseconds: 1500),
      );
    }
  }

  void toRegistration() => ExtendedNavigator.root.push(Routes.registrationPage);

  void _login() async {
    final email = _emailController.value.text;
    final password = _passwordController.value.text;
    setLoading(true);
    final user = await _authService.requestLogin(email, password);
    setLoading(false);
    await _handleLoginResponse(user);
  }

  void _handleLoginResponse(dynamic user) async {
    if (user != null) {
      await ExtendedNavigator.root.pop();
    } else {
      showSnackBar(
        'Correo y/o contraseña incorrectos',
        duration: const Duration(milliseconds: 1800),
      );
    }
  }
}
