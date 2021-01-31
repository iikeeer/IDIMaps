import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_final_whats_app/src/logs/logs.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class MapMarker extends StatefulWidget {
  MapMarker({Key key}) : super(key: key);

  Set<Marker> markers = {};
  Set<Circle> circles = {};

  Set<Marker> setMarkers(context) {
    for (var a = 0; a < globals.rutas.length - 1; a++) {
      for (var i = 0; i < globals.rutas[a]['listaPuntos'].length; i++) {
        if (globals.rutas[a]['nombre'] == globals.ruta_nombre) {
          markers.add(
            Marker(
              markerId: MarkerId(
                globals.rutas[a]['listaPuntos'][i]['nombre'].toString(),
              ),
              position: LatLng(
                globals.rutas[a]['listaPuntos'][i]['lat'],
                globals.rutas[a]['listaPuntos'][i]['log'],
              ),
              infoWindow: InfoWindow(
                title: globals.rutas[a]['listaPuntos'][i]['nombre'].toString(),
              ),
            ),
          );
        }
      }
    }

    return markers;
  }

  Set<Circle> setCircles(context) {
    for (var a = 0; a < globals.rutas.length - 1; a++) {
      for (var i = 0; i < globals.rutas[a]['listaPuntos'].length; i++) {
        if (globals.rutas[a]['nombre'] == globals.ruta_nombre) {
          circles.add(
            Circle(
              circleId: CircleId(
                globals.rutas[a]['listaPuntos'][i]['nombre'].toString(),
              ),
              center: LatLng(
                globals.rutas[a]['listaPuntos'][i]['lat'],
                globals.rutas[a]['listaPuntos'][i]['log'],
              ),
              radius: 40,
              fillColor: Colors.blue.withOpacity(0.3),
              strokeColor: Colors.red,
              strokeWidth: 2,
            ),
          );
        }
      }
    }
    circles.map((e) => {print(e)});
    return circles;
  }

  @override
  _MapMarkerState createState() => _MapMarkerState();
}

class _MapMarkerState extends State<MapMarker> {
  @override
  Widget build(BuildContext context) {}
}
