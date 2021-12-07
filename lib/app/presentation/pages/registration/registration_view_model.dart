import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';

class RegistrationViewModel extends BaseViewModel {
  RegistrationViewModel();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _registrationKey = GlobalKey<FormState>();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get registrationKey => _registrationKey;

  void toLogin() => ExtendedNavigator.root.popAndPush(Routes.loginPage);
}
