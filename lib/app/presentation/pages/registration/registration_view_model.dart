import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';
import 'package:piccolina_restaurant_app/core/services/auth_service.dart';
import 'package:piccolina_restaurant_app/core/utils/validators.dart';

class RegistrationViewModel extends BaseViewModel {
  RegistrationViewModel();

  final authService = inject<AuthService>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _registrationKey = GlobalKey<FormState>();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get registrationKey => _registrationKey;

  String emailValidator(String value) => value.isEmpty
      ? 'El correo no puede estar vacío'
      : !isValidEmail(value)
          ? 'Ingrese un correo con formato válido'
          : null;

  String passwordValidator(String value) =>
      value.isNotEmpty ? null : 'La contraseña no puede estar vacía';

  void toLogin() => ExtendedNavigator.root.popAndPush(Routes.loginPage);

  void validate() {
    final _isValid = _registrationKey.currentState.validate();
    if (_isValid) {
      _create();
    } else {
      showSnackBar(
        '¡Verifique que no tenga errores!',
        duration: const Duration(milliseconds: 1500),
      );
    }
  }

  void _create() async {
    final name = _nameController.value.text;
    final email = _emailController.value.text;
    final password = _passwordController.value.text;
    setLoading(true);
    final created = await authService.create(name, email, password);
    setLoading(false);
    if (created) {
      showSnackBar('Su cuenta se ha creado!');
      ExtendedNavigator.root.pop();
    } else {
      showSnackBar('Ocurrió un error');
    }
  }
}
