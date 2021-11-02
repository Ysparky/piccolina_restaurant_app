import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
          child: Stack(
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
              Container(
                margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                      //key: _formKey,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child:
                                      // SvgPicture.asset(
                                      //     "assets/icons/logo-piccolina.svg"),
                                      Icon(
                                    Icons.person,
                                    color: Colors.grey.shade300,
                                    size: 80.0,
                                  ),
                                ),
                                // Container(
                                //   padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                //   child: Icon(
                                //     Icons.add_circle,
                                //     color: Colors.grey.shade700,
                                //     size: 25.0,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 180,
                          ),
                          Container(
                            child: TextField(
                              style: TextStyle(fontFamily: 'RobotoMono'),
                              obscureText: true,
                              decoration:
                                  // ThemeHelper().textInputDecoration(
                                  //     'Contrasena', 'Ingresa tu contrasena'),
                                  InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54),
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
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: TextField(
                              obscureText: true,
                              decoration:
                                  // ThemeHelper().textInputDecoration(
                                  //     'Contrasena', 'Ingresa tu contrasena'),
                                  InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.white),
                                ),
                                //filled: true,
                                //hoverColor: Colors.blue.shade100,
                                //fillColor: Colors.white,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                //focusColor: Colors.blue,
                                hintText: "Correo",
                                hintStyle: TextStyle(color: Colors.white),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                            //decoration:ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          // Container(
                          //   child: TextFormField(
                          //     decoration: ThemeHelper().textInputDecoration(
                          //         "Correo", "Ingresa correo electronico"),
                          //     keyboardType: TextInputType.emailAddress,
                          //     validator: (val) {
                          //       if (!(val!.isEmpty) &&
                          //           !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                          //               .hasMatch(val)) {
                          //         return "Ingrese una direccion de correo valida";
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          // ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextField(
                              obscureText: true,
                              decoration:
                                  // ThemeHelper().textInputDecoration(
                                  //     'Contrasena', 'Ingresa tu contrasena'),
                                  InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54),
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
                          // Container(
                          //   child: TextFormField(
                          //     decoration: ThemeHelper().textInputDecoration(
                          //         "Numero de telefono",
                          //         "Ingresa numero de telefono"),
                          //     keyboardType: TextInputType.phone,
                          //     validator: (val) {
                          //       if (!(val!.isEmpty) &&
                          //           !RegExp(r"^(\d+)*$").hasMatch(val)) {
                          //         return "Ingresa un numero de telefono valido";
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          // ),
                          SizedBox(height: 20.0),
                          // Container(
                          //   child: TextFormField(
                          //     obscureText: true,
                          //     decoration: ThemeHelper().textInputDecoration(
                          //         "Password*", "Ingresa tu contrasena"),
                          //     validator: (val) {
                          //       if (val!.isEmpty) {
                          //         return "Porfavor ingresa una contrasena";
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          // ),
                          SizedBox(height: 6.0),
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
                                        style: TextStyle(color: Colors.white),
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
                            validator: (value) {
                              if (!checkboxValue) {
                                return 'Necesitas aceptar los terminos y condiciones!.';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 6.0),
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
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => ProfilePage()),
                                      (Route<dynamic> route) => false);
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                            //child: Text('Don\'t have an account? Create'),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  style: TextStyle(color: Colors.white),
                                  text: "Ya tienes cuenta? "),
                            ])),
                          ),
                          Container(
                            child: Text.rich(TextSpan(children: [
                              //TextSpan(text: "No tienes cuenta? "),
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
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor),
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
