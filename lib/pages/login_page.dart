// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/common/theme_helper.dart';
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
      backgroundColor: HexColor("#ff3333"),
      body: Container(
        decoration: new BoxDecoration(
            gradient: LinearGradient(
                colors: [
              HexColor("#ff6666"),
              HexColor("#ff6666"),
              HexColor("#ff3333"),
              HexColor("#ff3333")
            ],
                stops: [
              0.5,
              0.5,
              0.8,
              0.8
            ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true,
                    Icons.login_rounded), //let's create a common header widget
              ),
              Container(
                child: SizedBox(
                  height: 50,
                ),
              ),
              SafeArea(
                child: Container(
                    //color: Colors.blue,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(
                        20, 10, 20, 10), // This will be the login form
                    child: Column(
                      children: [
                        // Text(
                        //   'Bienvenido',
                        //   style: TextStyle(
                        //       fontSize: 60, fontWeight: FontWeight.bold),
                        // ),
                        Text(
                          'Inicia Sesion con tu cuenta',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        SizedBox(height: 30.0),
                        Form(
                            //key: _formKey,
                            child: Column(
                          children: [
                            Container(
                              child: TextField(
                                style: TextStyle(fontFamily: 'RobotoMono'),
                                obscureText: true,
                                decoration:
                                    // ThemeHelper().textInputDecoration(
                                    //     'Contrasena', 'Ingresa tu contrasena'),
                                    InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white54),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.white),
                                  ),
                                  //filled: true,
                                  //hoverColor: Colors.blue.shade100,
                                  //fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  focusColor: Colors.white,
                                  hintText: "Nombre de usuario",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: UnderlineInputBorder(),
                                ),
                              ),
                              //decoration:ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              child: TextField(
                                obscureText: true,
                                decoration:
                                    // ThemeHelper().textInputDecoration(
                                    //     'Contrasena', 'Ingresa tu contrasena'),
                                    InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white54),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.white),
                                  ),
                                  //filled: true,
                                  //hoverColor: Colors.blue.shade100,
                                  //fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.vpn_key_rounded,
                                    color: Colors.white,
                                  ),
                                  //focusColor: Colors.blue,
                                  hintText: "Contrasena",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              //decoration:ThemeHelper().inputBoxDecorationShaddow(),
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
                                  "Olvidaste tu contraseña?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                  ),
                                  // border: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Iniciar Sesion'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                onPressed: () {
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfilePage()));
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    style: TextStyle(color: Colors.white),
                                    text: "No tienes cuenta? "),
                                TextSpan(
                                  text: 'Creala',
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
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor),
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
  // ThemeHelper().textInputDecoration(
                                  //     'Nombre de usuario',
                                  //     'Ingresa tu nombre de usuario'),