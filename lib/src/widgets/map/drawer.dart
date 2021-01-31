import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_final_whats_app/src/widgets/map/drawerHeader.dart';
import 'package:proyecto_final_whats_app/src/widgets/map/googleMap.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final double _zoom = 10;
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeaderWidget(),
          //DrawerBodyWidget

          ListTile(
            onTap: () {
              //GoogleMapWidget();
              Navigator.of(context).pop();
            },
            leading: Icon(Icons.filter_1_outlined),
            title: Text("Ruta 1"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
        ],
      ),
    );
  }
}
