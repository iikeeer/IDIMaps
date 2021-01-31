import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class GlobalVars extends StatefulWidget {
  GlobalVars({Key key}) : super(key: key);

  void globalVars() {
    print("----------------------------------------------------");
    print("GLOBAL VARS");
    print("\tlogged?: " + globals.isLogged.toString());
    print("\tid: " + globals.id.toString());
    print("\tusuario: " + globals.name.toString());
    print("\tapellido: " + globals.apellido.toString());
    print("\temail: " + globals.email.toString());
    print("----------------------------------------------------");
  }

  void allData(String data) {
    print("----------------------------------------------------");
    print("ALL DATA");
     debugPrint(data.toString(), wrapWidth: 1024);

    print("----------------------------------------------------");
  }

  void isLogged() {
    print("----------------------------------------------------");
    print("IS LOGGED");
    print("\tlogged?: " + globals.isLogged.toString());
    print("----------------------------------------------------");
  }

  void loginFieldsData(String user, String password) {
    print("----------------------------------------------------");
    print("LOGIN INPUT FIELDS DATA:");
    print("\tUsername: " + user);
    print("\tPassword: " + password);
    print("----------------------------------------------------");
  }

  void polylinesData(String data) {
    print("----------------------------------------------------");
    print("POLYLINE DATA:");
    print("\t " + data.toString() + "");
    print("----------------------------------------------------");
  }

  void markersData(String data) {
    print("----------------------------------------------------");
    print("MARKERS DATA:");
    print("\t " + data.toString() + "");
    print("----------------------------------------------------");
  }

  @override
  _GlobalVarsState createState() => _GlobalVarsState();
}

class _GlobalVarsState extends State<GlobalVars> {
  @override
  Widget build(BuildContext context) {}
}
