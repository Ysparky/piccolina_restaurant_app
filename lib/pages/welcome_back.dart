// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:piccolina_restaurant_app/common/theme_helper.dart';
import 'package:piccolina_restaurant_app/pages/widgets/header_widget.dart';

import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
//import 'widgets/header_widget.dart';

class WelcomebackPage extends StatefulWidget {
  const WelcomebackPage({Key? key}) : super(key: key);

  @override
  _WelcomebackPageState createState() => _WelcomebackPageState();
}

class _WelcomebackPageState extends State<WelcomebackPage> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
              ), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      SizedBox(height: 30.0),
                      Text(
                        "Inicia sesion con tu cuenta",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: "Poppins"),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          //key: _formKey,
                          child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                            // ignore: deprecated_member_use
                            child: new RaisedButton(
                                padding: EdgeInsets.all(1.0),
                                color: const Color(0xFF4285F4),
                                onPressed: () async {},
                                child: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Image.asset(
                                          "assets/icons/google.png"),
                                      // SvgPicture.asset(
                                      //     "assets/icons/google.svg")
                                      //Icon(Icons.keyboard),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: new Text(
                                          "INICIA SESION CON GOOGLE"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                )),
                          ),
                          SizedBox(height: 10.0),

                          Container(
                            margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            // ignore: deprecated_member_use
                            child: new RaisedButton(
                                padding: EdgeInsets.all(1.0),
                                color: Colors.white,
                                onPressed: () async {},
                                child: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Image.asset(
                                          "assets/icons/facebook.png"),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: new Text(
                                          "INICIA SESION CON FACEBOOK"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                )),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            // ignore: deprecated_member_use
                            child: new RaisedButton(
                                padding: EdgeInsets.all(1.0),
                                color: Colors.white,
                                onPressed: () async {},
                                child: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Icon(Icons.email_rounded),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: new Text(
                                          "INICIA SESION CON EMAIL"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                )),
                          ),
                          SizedBox(height: 15.0),
                          // Container(
                          //   decoration:
                          //       ThemeHelper().buttonBoxDecoration(context),
                          //   child: ElevatedButton(
                          //     style: ThemeHelper().buttonStyle(),
                          //     child: Padding(
                          //       padding: EdgeInsets.fromLTRB(75, 5, 75, 5),
                          //       child: Text(
                          //         'Iniciar Sesion con email'.toUpperCase(),
                          //         style: TextStyle(
                          //             fontSize: 20,
                          //             fontWeight: FontWeight.bold,
                          //             color: Colors.black),
                          //       ),
                          //     ),
                          //     onPressed: () {
                          //       //After successful login we will redirect to profile page. Let's create profile page now
                          //       Navigator.pushReplacement(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => ProfilePage()));
                          //     },
                          //   ),
                          // ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                            //child: Text('Don\'t have an account? Create'),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "No tienes cuenta? ",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                  )),
                            ])),
                          ),
                          Container(
                            child: Text.rich(TextSpan(children: [
                              //TextSpan(text: "No tienes cuenta? "),
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
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
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
    );
  }
}
  // ThemeHelper().textInputDecoration(
                                  //     'Nombre de usuario',
                                  //     'Ingresa tu nombre de usuario'),
// Container(
//                             decoration:
//                                 ThemeHelper().buttonBoxDecoration(context),
//                             child: ElevatedButton(
//                               style: ThemeHelper().buttonStyle(),
//                               child: Padding(
//                                 padding: EdgeInsets.fromLTRB(75, 5, 75, 5),
//                                 child: Text(
//                                   'Iniciar Sesion con facebook'.toUpperCase(),
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 //After successful login we will redirect to profile page. Let's create profile page now
//                                 Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => ProfilePage()));
//                               },
//                             ),
//                           ),                                