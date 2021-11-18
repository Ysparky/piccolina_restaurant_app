import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/splash/splash_view_model.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashViewModel(),
      child: const BaseLoadingOverlay<SplashViewModel>(
        child: SplashPageBase(),
      ),
    );
  }
}

class SplashPageBase extends StatelessWidget {
  const SplashPageBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<SplashViewModel>(context);
    return Scaffold(
      key: _vm.scaffoldKey,
      backgroundColor: const Color(0xFFFF3131),
      extendBodyBehindAppBar: true,
      body: Center(
        child: AnimatedOpacity(
          opacity: _vm.opacity,
          duration: const Duration(milliseconds: 1000),
          child: SvgPicture.asset(
            'assets/icons/logo-piccolina.svg',
            width: wp(70),
          ),
        ),
      ),
    );
  }
}
