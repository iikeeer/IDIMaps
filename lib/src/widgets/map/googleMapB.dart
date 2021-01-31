import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:proyecto_final_whats_app/src/data/data.dart';

import 'package:proyecto_final_whats_app/src/data/polyline.dart';
import 'package:proyecto_final_whats_app/src/widgets/dialog/filterDialog.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/parseDataAll.dart';
import 'package:proyecto_final_whats_app/src/widgets/map/setMarkers.dart';
import 'package:proyecto_final_whats_app/src/widgets/map/setPolylines.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;
import 'package:geolocator/geolocator.dart';

class GoogleMapWidgetB extends StatefulWidget {
  GoogleMapWidgetB({Key key}) : super(key: key);

  @override
  GoogleMapWidgetState createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidgetB> {
  //SECURITY
  bool serviceEnabled;
  Location location = new Location();
  PermissionStatus permissionGranted;

  //MAPS
  GoogleMapController mapController;
  LatLng _center = const LatLng(43.345739, -1.797298);
  MapType _defaultMapType = MapType.normal;
  List<LatLng> polyPoints = [];
  Set<Polyline> polyLines = {};

  Set<Marker> markers = {};
  Set<Circle> circles = {};
  var dataP;
  var dataAll;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();

  }

  void checkLocationPermission() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<bool> inicio() async {
    print("object");

    return true;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: inicio(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
            ),
          );
        } else {
          //LOADER
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
