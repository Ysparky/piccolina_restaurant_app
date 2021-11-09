// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/common/theme_helper.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'profile_page.dart';
import 'widgets/header_widget.dart';

class ForgotPasswordVerificationPage extends StatefulWidget {
  const ForgotPasswordVerificationPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordVerificationPageState createState() =>
      _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState
    extends State<ForgotPasswordVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;

    return Scaffold(
        backgroundColor: Colors.white,
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
                SafeArea(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Verificacion',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Ingresa el codigo de verificacion que acabamos de enviar a tu correo',
                                style: TextStyle(
                                    // fontSize: 20,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              OTPTextField(
                                length: 4,
                                width: 300,
                                fieldWidth: 40,
                                style: TextStyle(
                                    fontSize: 40, color: Colors.black),
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.underline,
                                onCompleted: (pin) {
                                  setState(() {
                                    _pinSuccess = true;
                                  });
                                },
                              ),
                              SizedBox(height: 30.0),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Si no recibiste el codigo! ",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Reenviar',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ThemeHelper().alartDialog(
                                                  "Successful",
                                                  "Verification code resend successful.",
                                                  context);
                                            },
                                          );
                                        },
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.0),
                              Container(
                                decoration: _pinSuccess
                                    ? ThemeHelper().buttonBoxDecoration(context)
                                    : ThemeHelper().buttonBoxDecoration(
                                        context, "#AAAAAA", "#757575"),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        80, 10, 80, 10),
                                    child: Text(
                                      "Verificar".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onPressed: _pinSuccess
                                      ? () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              ProfilePage()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        }
                                      : null,
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
