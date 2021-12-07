import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piccolina_restaurant_app/common/theme_helper.dart';
import 'package:piccolina_restaurant_app/pages/catalog/visualizar_catalogo.dart';
import 'package:piccolina_restaurant_app/pages/maps/home_controller.dart';
import 'package:provider/provider.dart';

class HomeMapsPage extends StatelessWidget {
  const HomeMapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_) {
        final controller = HomeController();
        controller.onMarkerTap.listen((String id) {
          print("go to $id");
        });
        return controller;
      },
      child: Scaffold(
        //appBar: AppBar(),
        body: Stack(
          children: [
            Consumer<HomeController>(
              builder: (_, controller, __) => GoogleMap(
                markers: controller.markers,
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: controller.initialCameraPosition,
                myLocationButtonEnabled: false,
                onLongPress: controller.onTap,
                onTap: controller.onTap,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.2,
              maxChildSize: 0.8,
              minChildSize: 0.2,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: HexColor('#194e7a'),
                    ),
                    padding: EdgeInsets.fromLTRB(00, 00, 00, 0),
                    child: Column(
                      children: [
                        Container(
                          color: HexColor('#194e7a'),
                          padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                          margin: EdgeInsets.fromLTRB(00, 10, 00, 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tiempo estimado',
                                    style: TextStyle(
                                        color: Colors.white,
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10 - 15 minutos',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: HexColor('#154c79'),
                          padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                          margin: EdgeInsets.fromLTRB(00, 10, 00, 20),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Giancarlo Ruiz',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins',
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Cliente',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins',
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: HexColor('#154c79'),
                          padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                          margin: EdgeInsets.fromLTRB(00, 10, 00, 20),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '1901-Rd. Santa Ana, California',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '2061-Ranchview, California',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: HexColor('#194e7a'),
                          padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                          margin: EdgeInsets.fromLTRB(00, 10, 00, 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Visa Classic',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'S/. 29.30',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: HexColor('#194e7a'),
                          padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                          margin: EdgeInsets.fromLTRB(00, 10, 00, 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Detalle de orden',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Pizza mozarella',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                              fontSize: 20),
                                        ),
                                        Text(
                                          'Larga-XL',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '1X',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: HexColor('#194e7a'),
                          padding: EdgeInsets.fromLTRB(30, 00, 30, 00),
                          margin: EdgeInsets.fromLTRB(00, 10, 00, 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Detalle de pago',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Precio',
                                    style: TextStyle(
                                        color: Colors.white,
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'S/. 29.30',
                                    style: TextStyle(
                                        color: Colors.white,
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery',
                                    style: TextStyle(
                                        color: Colors.white,
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'S/. 5.70',
                                    style: TextStyle(
                                        color: Colors.white,
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'S/. 35.00',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side:
                                        BorderSide(color: HexColor('#ea6e28'))),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(50, 50)),
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor('#ea6e28')),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
                              child: Text(
                                'Pagar'.toUpperCase(),
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
                                      builder: (context) => HomeMapsPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side:
                                        BorderSide(color: HexColor('#ea6e28'))),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(50, 50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
                              child: Text(
                                'Cancelar'.toUpperCase(),
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
                                      builder: (context) => HomeMapsPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
