import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TabMapView extends StatefulWidget {
  @override
  TabMapViewState createState() {
    return TabMapViewState();
  }
}

class TabMapViewState extends State<TabMapView> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.hybrid,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(53.942348, 27.566848),
          zoom: 15.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: (<Marker>[
          Marker(
              markerId: MarkerId('Work'),
              draggable: false,
              position: LatLng(53.942348, 27.566848))
        ]).toSet());
  }
}
