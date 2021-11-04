import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/common/theme_helper.dart';

import 'forgot_password_verification_page.dart';
import 'login_page.dart';
import 'widgets/header_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          // decoration: new BoxDecoration(
          //     gradient: LinearGradient(
          //         colors: [
          //       HexColor("#ff6666"),
          //       HexColor("#ff6666"),
          //       HexColor("#ff3333"),
          //       HexColor("#ff3333")
          //     ],
          //         stops: [
          //       0.5,
          //       0.5,
          //       0.8,
          //       0.8
          //     ],
          //         begin: FractionalOffset.topCenter,
          //         end: FractionalOffset.bottomCenter)),
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
                SafeArea(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Olvidaste tu contrasena?',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 0.0,
                              ),
                              Text(
                                'Ingresa el correo electronico asociado a tu cuenta.',
                                style: TextStyle(
                                    // fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Te enviaremos un codigo de verificacion a tu correo para revisar la autentificacion.',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  // fontSize: 20,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins'),
                                  decoration:
                                      // ThemeHelper().textInputDecoration(
                                      //     'Contrasena', 'Ingresa tu contrasena'),
                                      InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2.0, color: Colors.red),
                                    ),
                                    //filled: true,
                                    //hoverColor: Colors.blue.shade100,
                                    //fillColor: Colors.white,
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                    //focusColor: Colors.blue,
                                    hintText: "Correo",
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                //decoration:ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              // Container(
                              //   child: TextFormField(
                              //     decoration: ThemeHelper().textInputDecoration(
                              //         "Email", "Enter your email"),
                              //     validator: (val) {
                              //       if (val!.isEmpty) {
                              //         return "Email can't be empty";
                              //       } else if (!RegExp(
                              //               r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                              //           .hasMatch(val)) {
                              //         return "Enter a valid email address";
                              //       }
                              //       return null;
                              //     },
                              //   ),
                              //   decoration:
                              //       ThemeHelper().inputBoxDecorationShaddow(),
                              // ),
                              SizedBox(height: 40.0),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      "Enviar".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordVerificationPage()),
                                      );
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Recuerdas tu contrasena? ",
                                        style: TextStyle(color: Colors.black)),
                                    TextSpan(
                                      text: 'Inicia Sesion',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()),
                                          );
                                        },
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
