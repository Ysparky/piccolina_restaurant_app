import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/pages/SingleInformation/singleinformation.dart';
import 'package:piccolina_restaurant_app/pages/forgot_password_page.dart';
import 'package:piccolina_restaurant_app/pages/login_page.dart';

class HomeCatalogPage extends StatelessWidget {
  const HomeCatalogPage({Key? key}) : super(key: key);

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
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        height: 60,
                        color: HexColor('#ffe6e6'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'INICIO',
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                                Expanded(
                                  child: Text(
                                    'Bienvenido,Giancarlo',
                                    style: TextStyle(fontFamily: "Poppins"),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              //color: Colors.amber,
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                ),
                                child: ClipOval(
                                  child: Icon(Icons.person),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        height: 60,
                        //color: Colors.white,
                        child: Container(
                            //color: Colors.blue,
                            child: TextField(
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Poppins'),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.red),
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.redAccent,
                            ),
                            focusColor: Colors.black,
                            hintText: "Escribe aqui para buscar",
                            hintStyle: TextStyle(
                                color: Colors.grey, fontFamily: "Poppins"),
                            border: UnderlineInputBorder(),
                          ),
                        )),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: HexColor("#ff3333"),
                          ),
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          height: 150,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Categorias',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: "Poppins"),
                                  ),
                                  Text(
                                    'Ver mas >',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Poppins"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.local_drink,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        Text(
                                          'Lasañas',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins"),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.local_pizza_rounded,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        Text(
                                          'Pizzas',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins"),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.breakfast_dining_rounded,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        Text(
                                          'Panes',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins"),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.food_bank,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        Text(
                                          'Ensaladas',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins"),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          //color: HexColor("#ff3333"),
                          ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: HexColor("#ffe6e6"),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        height: 500,
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              color: HexColor('#ffe6e6'),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Recomendados para ti',
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: HexColor('#ffffff'),
                                ),
                                // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                // margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                height: 120,
                                child: Column(
                                  children: [
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
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Colors.grey),
                                            padding: EdgeInsets.fromLTRB(
                                                50, 70, 40, 10),
                                            margin: EdgeInsets.fromLTRB(
                                                15, 20, 20, 20),
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
                                              style: TextStyle(
                                                  fontFamily: 'Poppins'),
                                            ),
                                            SizedBox(
                                              height: 45,
                                            ),
                                            Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 00, 50, 10),
                                                  child: Text(
                                                    'S/. 18.90',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 0.0, 10),
                                                  child: Text(
                                                    '4 mins',
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
                                  ],
                                )
                                //color: HexColor("#ff3333"),
                                ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: HexColor('#ffffff'),
                                ),
                                // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                // margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                height: 120,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Colors.grey),
                                            padding: EdgeInsets.fromLTRB(
                                                50, 70, 40, 10),
                                            margin: EdgeInsets.fromLTRB(
                                                15, 20, 20, 20),
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
                                              style: TextStyle(
                                                  fontFamily: 'Poppins'),
                                            ),
                                            SizedBox(
                                              height: 45,
                                            ),
                                            Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 00, 50, 10),
                                                  child: Text(
                                                    'S/. 18.90',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 0.0, 10),
                                                  child: Text(
                                                    '4 mins',
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
                                  ],
                                )
                                //color: HexColor("#ff3333"),
                                ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: HexColor('#ffffff'),
                                ),
                                // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                // margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                height: 120,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Colors.grey),
                                            padding: EdgeInsets.fromLTRB(
                                                50, 70, 40, 10),
                                            margin: EdgeInsets.fromLTRB(
                                                15, 20, 20, 20),
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
                                              style: TextStyle(
                                                  fontFamily: 'Poppins'),
                                            ),
                                            SizedBox(
                                              height: 45,
                                            ),
                                            Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 00, 50, 10),
                                                  child: Text(
                                                    'S/. 18.90',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 0.0, 10),
                                                  child: Text(
                                                    '4 mins',
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
                                  ],
                                )
                                //color: HexColor("#ff3333"),
                                ),
                          ],
                        ),
                      ),
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
