import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/login/login_view_model.dart';
import 'package:piccolina_restaurant_app/app/presentation/widgets/global_widgets.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const BaseLoadingOverlay<LoginViewModel>(
        child: LoginPageBase(),
      ),
    );
  }
}

class LoginPageBase extends StatelessWidget {
  const LoginPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<LoginViewModel>(context);
    final _node = FocusScope.of(context);

    return Scaffold(
      key: _vm.scaffoldKey,
      body: BaseScrollView(
        child: Column(
          children: [
            const PresentationHeaderWidget(),
            SizedBox(height: hp(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: wp(8)),
              child: Form(
                key: _vm.loginKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _vm.emailController,
                      icon: Icons.person,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: _node.nextFocus,
                      textInputAction: TextInputAction.next,
                      validator: _vm.emailValidator,
                    ),
                    SizedBox(height: hp(3)),
                    CustomTextFormField(
                      controller: _vm.passwordController,
                      icon: Icons.vpn_key_rounded,
                      hintText: 'Contraseña',
                      obscureText: true,
                      validator: _vm.passwordValidator,
                    ),
                    SizedBox(height: hp(5)),
                    CustomRoundedButton(
                      text: 'Iniciar Sesión',
                      onPressed: _vm.toRegistration,
                    ),
                    SizedBox(height: hp(7)),
                    Text(
                      '¿Aún no tienes cuenta?',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    GestureDetector(
                      onTap: _vm.toRegistration,
                      child: Text(
                        'Regístrate',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(height: hp(5)),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        '¿Olvidaste tu usuario y contraseña?',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
