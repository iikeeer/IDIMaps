import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final_whats_app/src/providers/routes.dart';

import 'package:proyecto_final_whats_app/src/widgets/map/drawer.dart';
import 'package:proyecto_final_whats_app/src/widgets/map/googleMap.dart';
import 'package:proyecto_final_whats_app/src/widgets/map/googleMapB.dart';
import 'package:proyecto_final_whats_app/src/widgets/map/searchButton.dart';

class MapPage extends StatefulWidget {
  //Ruta para el provider
  static const String routeName = '/MapPage';
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  @override
  Widget build(BuildContext context) {
    //Provider
    final routesProvider = Provider.of<MapRoutes>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Rutas"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: SearchButton(),
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: GoogleMapWidget(),
    );
  }
}
