import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class ParseDataAll extends StatefulWidget {
  var dataAll;
  ParseDataAll({Key key, this.dataAll}) : super(key: key);

  var localizaciones = [];
  var rutas = [];
  var puntos = [];

  void parseData(context) {
    for (var loc in dataAll) {
      localizaciones.add(loc);
    }
    for (var a = 0; a < localizaciones.length; a++) {
      for (var b = 0; b < localizaciones[a]['listaRutas'].length; b++) {
        rutas.add(localizaciones[a]['listaRutas'][b]);
      }
    }
    for (var c = 0; c < rutas.length; c++) {
      for (var d = 0; d < rutas[c]['listaPuntos'].length; d++) {
        puntos.add(rutas[c]['listaPuntos'][d]);
      }
    }

    globals.localizaciones = localizaciones;
    globals.rutas = rutas;
    globals.puntos = puntos;
  }

  @override
  _ParseDataAllState createState() => _ParseDataAllState();
}

class _ParseDataAllState extends State<ParseDataAll> {
  @override
  Widget build(BuildContext context) {}
}


