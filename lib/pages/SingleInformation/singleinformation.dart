import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/pages/forgot_password_page.dart';
import 'package:piccolina_restaurant_app/pages/login_page.dart';

class SingleInformationPage extends StatelessWidget {
  const SingleInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#ffe6e6'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Positioned(
                //   top: 50.0,
                //   child:
                SizedBox(
                  height: 130,
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset('assets/icons/pizza1.png'),
                      )
                    ],
                  ),
                ),
                //),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
