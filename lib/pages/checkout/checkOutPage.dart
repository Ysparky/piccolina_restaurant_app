import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/common/theme_helper.dart';
import 'package:piccolina_restaurant_app/pages/SingleInformation/singleinformation.dart';
import 'package:piccolina_restaurant_app/pages/catalog/visualizar_catalogo.dart';
import 'package:piccolina_restaurant_app/pages/forgot_password_page.dart';
import 'package:piccolina_restaurant_app/pages/login_page.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Verificacion'),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.fromLTRB(30, 00, 10, 00),
                margin: EdgeInsets.fromLTRB(00, 00, 00, 00),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Direccion de envio',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 20),
                        ),
                        Text(
                          'Cambiar',
                          style: TextStyle(
                              color: Colors.amber,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Cercado de lima',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Av. Morales duares cuadra 14',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.fromLTRB(30, 00, 10, 00),
                margin: EdgeInsets.fromLTRB(00, 00, 00, 00),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Detalle de orden',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SingleInformationPage()),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey),
                                padding: EdgeInsets.fromLTRB(50, 70, 40, 10),
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.end,
                          // mainAxisAlignment:
                          //     MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Spicy mozarella pizza',
                              style: TextStyle(fontFamily: 'Poppins'),
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Row(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 00, 50, 10),
                                  child: Text(
                                    'S/. 18.90',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0.0, 10),
                                  child: Text(
                                    '- 1 +',
                                    style: TextStyle(
                                        // fontWeight:
                                        //     FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.fromLTRB(30, 00, 10, 00),
                margin: EdgeInsets.fromLTRB(00, 00, 00, 00),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Metodo de pago',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 20),
                        ),
                        Text(
                          'Cambiar',
                          style: TextStyle(
                              color: Colors.amber,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Visa Classic',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Text('1881',
                                style: TextStyle(
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.fromLTRB(30, 00, 10, 00),
                margin: EdgeInsets.fromLTRB(00, 00, 00, 00),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Resumen de pago',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Precio',
                          style: TextStyle(
                              // color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 18),
                        ),
                        Text(
                          'S/. 29.30',
                          style: TextStyle(
                              //color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Envio',
                          style: TextStyle(
                              // color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 18),
                        ),
                        Text(
                          'S/. 5.70',
                          style: TextStyle(
                              //color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              // color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 20),
                        ),
                        Text(
                          'S/. 35.00',
                          style: TextStyle(
                              //color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
                    child: Text(
                      'ordenar'.toUpperCase(),
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
                            builder: (context) => CheckOutPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
