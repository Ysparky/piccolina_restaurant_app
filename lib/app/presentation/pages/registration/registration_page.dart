import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/registration/registration_view_model.dart';
import 'package:piccolina_restaurant_app/app/presentation/widgets/global_widgets.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegistrationViewModel(),
      child: const BaseLoadingOverlay<RegistrationViewModel>(
        child: RegistrationPageBase(),
      ),
    );
  }
}

class RegistrationPageBase extends StatelessWidget {
  const RegistrationPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<RegistrationViewModel>(context);
    final _node = FocusScope.of(context);

    return Scaffold(
      key: _vm.scaffoldKey,
      extendBodyBehindAppBar: true,
      body: BaseScrollView(
        child: Column(
          children: [
            const PresentationHeaderWidget(),
            SizedBox(height: hp(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: wp(8)),
              child: Form(
                key: _vm.registrationKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    CustomTextFormField(
                      icon: Icons.person,
                      hintText: 'Nombres y apellidos',
                      controller: _vm.nameController,
                      onEditingComplete: _node.nextFocus,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: hp(3)),
                    CustomTextFormField(
                      icon: Icons.email,
                      hintText: 'Correo',
                      controller: _vm.emailController,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: _node.nextFocus,
                      textInputAction: TextInputAction.next,
                      validator: _vm.emailValidator,
                    ),
                    SizedBox(height: hp(3)),
                    CustomTextFormField(
                      icon: Icons.vpn_key_rounded,
                      hintText: 'Contraseña',
                      controller: _vm.passwordController,
                      obscureText: true,
                      validator: _vm.passwordValidator,
                    ),
                    SizedBox(height: hp(3)),
                    CustomRoundedButton(
                      onPressed: _vm.validate,
                      text: 'Crear Cuenta',
                    ),
                    SizedBox(height: hp(7)),
                    Text(
                      '¿Ya tienes una cuenta?',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    GestureDetector(
                      onTap: _vm.toLogin,
                      child: Text(
                        'Inicia Sesión',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
