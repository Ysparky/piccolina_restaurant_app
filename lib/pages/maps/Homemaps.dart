import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
            Container(
              child: Text('Hola'),
            )
          ],
        ),
      ),
    );
  }
}
