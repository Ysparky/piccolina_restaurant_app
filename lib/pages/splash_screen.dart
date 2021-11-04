// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/pages/welcome_back.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    // ignore: unnecessary_new
    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => WelcomebackPage()),
            (route) => false);
      });
    });

    // ignore: unnecessary_new
    new Timer(Duration(milliseconds: 20), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: unnecessary_new
      decoration: new BoxDecoration(
        // ignore: unnecessary_new
        gradient: new LinearGradient(
          colors: [
            HexColor("#ff3333"),
            HexColor("#ff3333"),
          ],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 200.0,
            width: 200.0,
            child: Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SvgPicture.asset(
                    'assets/icons/logo-piccolina.svg',
                    height: 100,
                  ),
                  //Text("Bienvenido"),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // ClipOval(
                  //   child: Icon(
                  //     Icons.local_pizza_rounded,
                  //     size: 128,
                  //   ), //put your logo here`
                  // ),
                ],
              ),
            ),
            // decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.3),
            //         blurRadius: 2.0,
            //         offset: Offset(5.0, 3.0),
            //         spreadRadius: 2.0,
            //       )
            //     ]),
          ),
        ),
      ),
    );
  }
}
