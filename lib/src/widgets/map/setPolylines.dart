import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_final_whats_app/src/widgets/dialog/startRouteDialog.dart';

class MapPolyline extends StatefulWidget {
  Set<Polyline> polyLines = {};
  List<LatLng> polyPoints = [];

  MapPolyline({Key key, this.polyPoints}) : super(key: key);

  Set<Polyline> setPolylines(context) {
    Polyline polyline = Polyline(
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      onTap: () {
        StartRouteDialog().startRoute(context);
      },
      consumeTapEvents: true,
      polylineId: PolylineId("polyline"),
      color: Colors.lightBlue,
      points: polyPoints,
    );
    polyLines.add(polyline);

    return polyLines;
  }


  

  @override
  _MapPolylineState createState() => _MapPolylineState();
}

class _MapPolylineState extends State<MapPolyline> {
  @override
  Widget build(BuildContext context) {}
}
