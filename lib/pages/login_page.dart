// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/common/theme_helper.dart';
import 'package:piccolina_restaurant_app/pages/catalog/visualizar_catalogo.dart';
import 'package:piccolina_restaurant_app/pages/widgets/header_widget.dart';

import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
//import 'widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ffffff"),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: Stack(
                  children: [
                    HeaderWidget(_headerHeight, true, Icons.login_rounded),
                    Positioned(
                      left: 40.0,
                      top: 50.0,
                      child: SvgPicture.asset(
                        'assets/icons/logo-piccolina.svg',
                        height: 100.0,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    //let's create a common header widget
                  ],
                ),
              ),
              Container(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SafeArea(
                child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(
                        20, 10, 20, 10), // This will be the login form
                    child: Column(
                      children: [
                        Text(
                          'Inicia Sesion con tu cuenta',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Form(
                            //key: _formKey,
                            child: Column(
                          children: [
                            Container(
                              child: TextField(
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                    color: Colors.black, fontFamily: 'Poppins'),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.red),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  focusColor: Colors.black,
                                  hintText: "Nombre de usuario",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins"),
                                  border: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              child: TextField(
                                style: TextStyle(
                                    color: Colors.black, fontFamily: 'Poppins'),
                                obscureText: true,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.red),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.vpn_key_rounded,
                                    color: Colors.black,
                                  ),
                                  hintText: "Contraseña",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins"),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordPage()),
                                  );
                                },
                                child: Text(
                                  "¿Olvidaste tu contraseña?",
                                  style: TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
                                  child: Text(
                                    'Iniciar Sesion'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                onPressed: () {
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VisualizarCatalogo()));
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    text: "¿No tienes cuenta? "),
                                TextSpan(
                                  text: 'Registrate',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegistrationPage()));
                                    },
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ])),
                            ),
                          ],
                        )),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
