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
      backgroundColor: HexColor('#ffffff'),
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
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(90, 00, 90, 00),
                        //margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Image.asset('assets/icons/pizza1.png'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                            margin: EdgeInsets.fromLTRB(00, 10, 00, 00),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'S/. 18.90',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 20),
                                ),
                                Icon(
                                  Icons.favorite_border_outlined,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                            margin: EdgeInsets.fromLTRB(00, 00, 00, 05),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'S/. 21.90',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontFamily: 'Poppins',
                                          fontSize: 15),
                                    ),
                                    Text(
                                      '[25%]',
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontFamily: 'Poppins',
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                            margin: EdgeInsets.fromLTRB(00, 00, 00, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'PIZZA MOZARELLA',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(30, 07, 80, 07),
                            margin: EdgeInsets.fromLTRB(00, 00, 00, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 03, 10, 03),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white),
                                  child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.star_rate,
                                        color: Colors.yellow[600],
                                      ),
                                      Text('4.9'),
                                      Text(
                                        '[2490]',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 07, 10, 07),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white),
                                  child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '320',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '  kcal',
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 02, 10, 03),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white),
                                  child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        color: Colors.redAccent,
                                      ),
                                      Text(
                                        ' 50  min',
                                        //style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //here
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                            margin: EdgeInsets.fromLTRB(00, 10, 00, 00),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Elige Ingredientes:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(30, 15, 110, 15),
                            margin: EdgeInsets.fromLTRB(00, 10, 00, 00),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 20, 25, 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border:
                                              Border.all(color: Colors.grey),
                                          color: Colors.white),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.local_pizza,
                                            color: Colors.redAccent,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Queso',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 16),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 20, 25, 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border:
                                              Border.all(color: Colors.grey),
                                          color: Colors.white),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.local_pizza,
                                            color: Colors.redAccent,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Peperoni',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 16),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 20, 25, 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border:
                                              Border.all(color: Colors.grey),
                                          color: Colors.white),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.local_pizza,
                                            color: Colors.redAccent,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Pimienta',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 16),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                            margin: EdgeInsets.fromLTRB(00, 10, 00, 00),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Calificaciones:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            margin: EdgeInsets.fromLTRB(00, 10, 00, 00),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '4.9',
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                fontFamily: 'Poppins'),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '/5',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Text(
                                          '(2,469 calificaciones)',
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(00, 10, 18, 10),
                                  // margin: EdgeInsets.fromLTRB(00, 00, 00, 00),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 00, 00, 00),
                                        margin:
                                            EdgeInsets.fromLTRB(00, 00, 0, 00),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            Text('5'),
                                            Stack(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 150, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 5, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 130, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 00, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text('2365')
                                            // LinearProgressIndicator(
                                            //   backgroundColor: Colors.grey,
                                            //   value: 0.7,
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 00, 00, 00),
                                        margin:
                                            EdgeInsets.fromLTRB(00, 00, 5, 00),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            Text('4'),
                                            Stack(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 150, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 5, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 30, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 00, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text('85')
                                            // LinearProgressIndicator(
                                            //   backgroundColor: Colors.grey,
                                            //   value: 0.7,
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 00, 00, 00),
                                        margin:
                                            EdgeInsets.fromLTRB(00, 00, 5, 00),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            Text('3'),
                                            Stack(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 150, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 5, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 20, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 00, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text('17')
                                            // LinearProgressIndicator(
                                            //   backgroundColor: Colors.grey,
                                            //   value: 0.7,
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 00, 00, 00),
                                        margin:
                                            EdgeInsets.fromLTRB(00, 00, 5, 00),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            Text('2'),
                                            Stack(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 150, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 5, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 23, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 00, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text('20')
                                            // LinearProgressIndicator(
                                            //   backgroundColor: Colors.grey,
                                            //   value: 0.7,
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 00, 00, 00),
                                        margin:
                                            EdgeInsets.fromLTRB(00, 00, 5, 00),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            Text('1'),
                                            Stack(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 150, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 5, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 10, 5),
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 00, 00, 00),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    //border: Border.all(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text('10')
                                            // LinearProgressIndicator(
                                            //   backgroundColor: Colors.grey,
                                            //   value: 0.7,
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
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
