import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:piccolina_restaurant_app/core/utils/validators.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel();

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
        'Formulario con errores',
        type: SnackBarType.secondary,
        // onPressed: () {},
      );
    }
  }

  void toRegistration() => scaffoldKey.currentState.context.router.popAndPush(
        const RegistrationRoute(),
      );

  void _login() {
    // setLoading(true);
    // final _email = _emailController.text;
    // final _password = _passwordController.text;
    // final response = await _service.login(_email, _password, _rememberUser);
    // if (response.data != null) {
    //   await ExtendedNavigator.root.push(Routes.roleSelectorPage);
    // } else {
    //   showSnackBar(
    //     response.message ? 'Correo y/o contraseña incorrectos',
    //     type: SnackBarType.secondary,
    //   );
    // }
    // setLoading(false);
  }
}
