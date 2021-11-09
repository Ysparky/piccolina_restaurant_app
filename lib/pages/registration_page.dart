import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/common/theme_helper.dart';
import 'package:piccolina_restaurant_app/pages/login_page.dart';
import 'package:piccolina_restaurant_app/pages/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'profile_page.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
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
                ), //let's create a common header widget
              ),
              Container(
                //color: Colors.blue,
                margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                      //key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            'Registra tu nueva cuenta',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'Poppins'),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2.0, color: Colors.red),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                focusColor: Colors.black,
                                hintText: "Nombre de usuario",
                                hintStyle: TextStyle(
                                    color: Colors.black, fontFamily: "Poppins"),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'Poppins'),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2.0, color: Colors.red),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                //focusColor: Colors.blue,
                                hintText: "Correo",
                                hintStyle: TextStyle(color: Colors.black),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextField(
                              obscureText: true,
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'Poppins'),
                              decoration:
                                  // ThemeHelper().textInputDecoration(
                                  //     'Contrasena', 'Ingresa tu contrasena'),
                                  InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2.0, color: Colors.red),
                                ),
                                prefixIcon: Icon(
                                  Icons.vpn_key_rounded,
                                  color: Colors.black,
                                ),
                                //focusColor: Colors.blue,
                                hintText: "Contraseña",
                                hintStyle: TextStyle(color: Colors.black),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          FormField<bool>(
                            builder: (state) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                          activeColor: Colors.black,
                                          value: checkboxValue,
                                          onChanged: (value) {
                                            setState(() {
                                              checkboxValue = value!;
                                              state.didChange(value);
                                            });
                                          }),
                                      Text(
                                        "Acepto todos los terminos y condiciones.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.errorText ?? '',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Theme.of(context).errorColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                            // validator: (value) {
                            //   if (!checkboxValue) {
                            //     return 'Necesitas aceptar los terminos y condiciones!.';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                          ),
                          //SizedBox(height: 2.0),
                          Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 10, 80, 10),
                                child: Text(
                                  "Registrar".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                //if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()),
                                    (Route<dynamic> route) => false);
                                //}
                              },
                            ),
                          ),
                          //SizedBox(height: 5.0),
                          Container(
                            //color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                            //child: Text('Don\'t have an account? Create'),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins'),
                                  text: "Ya tienes cuenta? "),
                              TextSpan(
                                text: 'Inicia Sesion',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ])),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
