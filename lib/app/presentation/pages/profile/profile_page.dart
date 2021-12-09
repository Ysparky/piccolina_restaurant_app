import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/profile/profile_view_model.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
import 'package:piccolina_restaurant_app/core/models/login_response.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileVIewModel(),
      child: const BaseLoadingOverlay<ProfileVIewModel>(
        child: ProfilePageBase(),
      ),
    );
  }
}

class ProfilePageBase extends StatelessWidget {
  const ProfilePageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<ProfileVIewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFDFBF9),
            Color(0xFFFFF3ED),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: StreamBuilder(
        initialData: _vm.activeSession ? _vm.session : null,
        stream: _vm.sessionStream,
        builder: (context, AsyncSnapshot<LoginResponse> snapshot) =>
            snapshot.hasData
                ? UserProfileColumn(vm: _vm)
                : LoginPlaceholder(vm: _vm),
      ),
    );
  }
}

class LoginPlaceholder extends StatelessWidget {
  const LoginPlaceholder({
    Key key,
    @required ProfileVIewModel vm,
  })  : _vm = vm,
        super(key: key);

  final ProfileVIewModel _vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/img/undraw_login_re_4vu2.svg'),
          RawMaterialButton(
            onPressed: _vm.toLogin,
            elevation: 0,
            fillColor: const Color(0xFFF19127),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: wp(5),
              vertical: hp(1.5),
            ),
            child: Text(
              'Iniciar Sesión',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfileColumn extends StatelessWidget {
  const UserProfileColumn({
    Key key,
    @required ProfileVIewModel vm,
  })  : _vm = vm,
        super(key: key);

  final ProfileVIewModel _vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: wp(5),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Perfil',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          UserProfileHeader(),
          SizedBox(height: hp(3)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: wp(5)),
              child: Column(
                children: [
                  OptionTile(
                    icon: Icons.shopping_basket_outlined,
                    onTap: () {},
                    text: 'Mis Pedidos',
                  ),
                  OptionTile(
                    icon: Icons.location_on_rounded,
                    onTap: () {},
                    text: 'Direcciones',
                  ),
                  OptionTile(
                    icon: Icons.credit_card_rounded,
                    onTap: () {},
                    text: 'Tarjetas',
                  ),
                  OptionTile(
                    icon: Icons.logout_rounded,
                    onTap: _vm.logout,
                    text: 'Cerrar sesión',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: hp(3)),
        ],
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  const OptionTile({
    Key key,
    @required this.onTap,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final void Function() onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      minLeadingWidth: wp(1),
      title: Text(text),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<ProfileVIewModel>(context);
    return Container(
      height: hp(40),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF59A00),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: wp(16.5),
              backgroundColor: Color(0xFFffb000),
              child: CircleAvatar(
                radius: wp(13),
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(_vm.imageUrl),
                  radius: wp(12),
                ),
              ),
            ),
            SizedBox(height: hp(1.5)),
            Text(
              _vm.session.fullName,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
