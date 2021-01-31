import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:proyecto_final_whats_app/src/logs/logs.dart';

import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class Login {
  final String username;
  final String password;

  Login({this.username, this.password});

  Future login() async {
    var url = 'http://' + globals.ip + ':' + globals.port + '/usuarios/login';
    var body =
        convert.jsonEncode({'usuario': username, 'contraseña': password});

    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      if (data != null) {
        if (data.isEmpty) {
          print("USUARIO O CONTRASEÑA ERRONEOS");
          return false;
        } else {
          globals.isLogged = true;
          globals.id = data['id_usuario'];
          globals.name = data['usuario'];
          globals.apellido = data['apellido'];
          globals.email = data['email'];
          GlobalVars().globalVars();
          return true;
        }
      }
    } else {
      print("ERROR");
      return null;
    }
  }
}
