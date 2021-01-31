import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/logs/logs.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class NetworkHelper {
  NetworkHelper({this.startLng, this.startLat, this.endLng, this.endLat});

  final String url = 'https://api.openrouteservice.org/v2/directions/';
  final String apiKey =
      '5b3ce3597851110001cf62484e03a1c51c4247c3bac4e68edbd81f2c';
  final String pathParam = 'foot-walking'; // Change it if you want
  final double startLng;
  final double startLat;
  final double endLng;
  final double endLat;

  Future getData() async {
    http.Response response = await http.get(
        '$url$pathParam?api_key=$apiKey&start=$startLng,$startLat&end=$endLng,$endLat');

    if (response.statusCode == 200) {
      String data = response.body;
      if (data != null) {
        print(data);
        //GlobalVars().polylinesData(data);
        return jsonDecode(data);
      } else {
        return Container(
          height: 300,
          child: CircularProgressIndicator(),
        );
      }
    }
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}
