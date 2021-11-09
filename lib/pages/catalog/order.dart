import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderCatalogPage extends StatelessWidget {
  const OrderCatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.1,
          0.6,
          0.8,
          0.9,
        ],
        colors: [
          HexColor('#ffe6e6'),
          Colors.white,
          HexColor('#ffe6e6'),
          HexColor('#ffe6e6'),
        ],
      )),
      child: Center(
          child: Text(
        'Order',
        style: TextStyle(fontSize: 60, fontFamily: "Poppins"),
      )),
      //color: Colors.red[100],
    ));
  }
}
