import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mapsToolkit;
import 'package:proyecto_final_whats_app/src/data/data.dart';

import 'package:proyecto_final_whats_app/src/data/polyline.dart';
import 'package:proyecto_final_whats_app/src/widgets/dialog/filterDialog.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/parseDataAll.dart';
import 'package:proyecto_final_whats_app/src/widgets/map/setMarkers.dart';
import 'package:proyecto_final_whats_app/src/widgets/map/setPolylines.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class GoogleMapWidget extends StatefulWidget {
  GoogleMapWidget({Key key}) : super(key: key);

  @override
  GoogleMapWidgetState createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget> {
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
  List<Set<Polyline>> polyAll = [];
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  var dataP;
  var dataAll;
  double distanceBTWUserAndPoint;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(intervalDuration: Duration(seconds: 5))
            .listen((Position position) {
      if (position == null) {
        print("En paradero desconocido");
      } else {
        print("lat: " +
            position.latitude.toString() +
            " , " +
            "log: " +
            position.longitude.toString());
      }

      insideArea(position.latitude, position.longitude);
    });
  }

  void checkLocationPermission() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        SystemNavigator.pop();
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

  Future<bool> getData() async {
    if (globals.ruta_nombre == null) {
      await getAllData();
    }
    await data2();
    return true;
  }

  Future<bool> data2() async {
    for (var a = 0; a < globals.rutas.length - 1; a++) {
      for (var i = 0; i < globals.rutas[a]['listaPuntos'].length - 1; i++) {
        if (globals.rutas[a]['nombre'] == globals.ruta_nombre) {
          markers = MapMarker().setMarkers(context);
          circles = MapMarker().setCircles(context);
          await getPolylineData(a, i);
          polyLines = MapPolyline(polyPoints: polyPoints).setPolylines(context);
        }
      }
    }
    return true;
  }

  Future<bool> getAllData() async {
    GetData data = GetData();
    dataAll = await data.getDataAll();
    ParseDataAll(dataAll: dataAll).parseData(context);

    return true;
  }

  Future<bool> getPolylineData(a, i) async {
    NetworkHelper network = new NetworkHelper(
      startLat: globals.rutas[a]['listaPuntos'][i]['lat'],
      startLng: globals.rutas[a]['listaPuntos'][i]['log'],
      endLat: globals.rutas[a]['listaPuntos'][i + 1]['lat'],
      endLng: globals.rutas[a]['listaPuntos'][i + 1]['log'],
    );

    try {
      dataP = await network.getData();
      LineString ls =
          LineString(dataP['features'][0]['geometry']['coordinates']);

      for (int i = 0; i < ls.lineString.length; i++) {
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }
    } catch (e) {
      print(e);
    }

    return true;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void insideArea(userLat, userLog) {
    for (var a = 0; a < globals.rutas.length - 1; a++) {
      for (var i = 0; i < globals.rutas[a]['listaPuntos'].length; i++) {
        if (globals.rutas[a]['nombre'] == globals.ruta_nombre &&
            globals.ruta_iniciada == true) {
          double distanceBTWUserAndPoint =
              mapsToolkit.SphericalUtil.computeDistanceBetween(
                  mapsToolkit.LatLng(globals.rutas[a]['listaPuntos'][i]['lat'],
                      globals.rutas[a]['listaPuntos'][i]['log']),
                  mapsToolkit.LatLng(userLat, userLog));

          if (distanceBTWUserAndPoint < 40) {
            print("esta en el punto");
          } else {
            print("NO esta en el punto");
          }
        }
      }
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: GoogleMap(
              onTap: (a) {
                if (globals.ruta_iniciada == false) {
                  polyPoints = [];
                  setState(() {});
                }
              },
              compassEnabled: true,
              onMapCreated: onMapCreated,
              markers: markers,
              circles: circles,
              polylines: polyLines,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              buildingsEnabled: true,
              indoorViewEnabled: true,
              mapType: _defaultMapType,
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
