import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/pages/home_page.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;
import 'package:proyecto_final_whats_app/src/widgets/map/googleMap.dart';

class DetallesDialog extends StatefulWidget {
  DetallesDialog({Key key}) : super(key: key);

  void detallesDialog(context) {
    AwesomeDialog dialogC;
    dialogC = AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      headerAnimationLoop: false,
      dialogType: DialogType.INFO,
      body: Center(
        child: Column(
          children: [
            Container(
              height: 20,
              child: Text("         Nombre  Nº Puntos   Transporte"),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: numloc(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        globals.ruta_nombre =
                            globals.localizaciones[localization()]['listaRutas']
                                [index]['nombre'];
                        dialogC.dissmiss();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.timeline),
                          Text(
                            "   " +
                                globals.localizaciones[localization()]
                                    ['listaRutas'][index]['nombre'] +
                                "       " +
                                globals
                                    .localizaciones[localization()]
                                        ['listaRutas'][index]['listaPuntos']
                                    .length
                                    .toString() +
                                "             " +
                                globals.localizaciones[localization()]
                                    ['listaRutas'][index]['transporte'],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    )..show();
  }

  int numloc() {
    for (var i = 0; i < globals.localizaciones.length; i++) {
      if (globals.localizaciones[i]['nombre'] == globals.loc) {
        return globals.localizaciones[i]['listaRutas'].length;
      }
    }
    return 99;
  }

  int localization() {
    for (var i = 0; i < globals.localizaciones.length; i++) {
      if (globals.localizaciones[i]['nombre'] == globals.loc) {
        return i;
      }
    }
    return 99;
  }

  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<DetallesDialog> {
  @override
  Widget build(BuildContext context) {}
}
