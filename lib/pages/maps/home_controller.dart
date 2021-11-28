import 'dart:async';

import 'package:flutter/cupertino.dart' show ChangeNotifier, Offset;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piccolina_restaurant_app/pages/utils/map_style.dart';

class HomeController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(-11.9929155, -77.0540056),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) {
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    // final icon = await BitmapDescriptor.fromAssetImage(
    //   const ImageConfiguration(),
    //   'assets/'
    //   );
    final marker = Marker(
        markerId: markerId,
        position: position,
        draggable: true,
        //icon: icon,
        //icon: BitmapDescriptor.defaultMarkerWithHue(200),
        //anchor: const Offset(0.5,1),
        onTap: () {
          _markersController.sink.add(id);
        },
        onDragEnd: (newPosition) {
          print("the new position $newPosition");
        });
    _markers[markerId] = marker;
    notifyListeners();
  }

  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
