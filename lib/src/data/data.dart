import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_final_whats_app/src/logs/logs.dart';

import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class GetData {
  Future getDataAll() async {
    var url =
        'http://' + globals.ip + ':' + globals.port + '/localizaciones/all';

    http.Response response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      var data = response.body;
      if (data != null) {
        GlobalVars().allData(data);
        return (jsonDecode(data));
      } else {
        return null;
      }
    }
  }
}
