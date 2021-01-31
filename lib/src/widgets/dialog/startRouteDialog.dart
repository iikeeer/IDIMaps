import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class StartRouteDialog extends StatefulWidget {
  StartRouteDialog({Key key}) : super(key: key);

  List<Widget> makeBody(context, dialog) {
    List<Widget> children = new List<Widget>();

    for (var a = 0; a < globals.rutas.length - 1; a++) {
      if (globals.rutas[a]['nombre'] == globals.ruta_nombre) {
        children.addAll([
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              autofocus: true,
              enabled: false,
              initialValue: globals.rutas[a]['nombre'].toString(),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Nombre',
                prefixIcon: Icon(Icons.text_fields),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              autofocus: true,
              enabled: false,
              initialValue: globals.rutas[a]['transporte'].toString(),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Vehiculo",
                prefixIcon: Icon(
                  Icons.device_hub,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              autofocus: true,
              enabled: false,
              initialValue: globals.rutas[a]['tiempo'].toString(),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Tiempo',
                prefixIcon: Icon(Icons.watch_later),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              autofocus: true,
              enabled: false,
              initialValue: globals.rutas[a]['km_totales'].toString(),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Km',
                prefixIcon: Icon(Icons.timeline),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              AnimatedButton(
                width: MediaQuery.of(context).size.width / 3,
                color: Colors.green,
                text: 'Iniciar',
                pressEvent: () {
                  globals.ruta_iniciada = true;
                  Navigator.pop(context);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Iniciando ruta...'),
                      duration: Duration(seconds: 4),
                    ),
                  );
                },
              ),
              AnimatedButton(
                width: MediaQuery.of(context).size.width / 3,
                color: Colors.red,
                text: 'Cerrar',
                pressEvent: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ]);
      }
    }

    return children;
  }

  void startRoute(context) {
    AwesomeDialog dialog;
    dialog = AwesomeDialog(
      context: context,
      width: MediaQuery.of(context).size.width,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      headerAnimationLoop: false,
      keyboardAware: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: makeBody(context, dialog),
        ),
      ),
    )..show();
  }

  @override
  _StartRouteDialogState createState() => _StartRouteDialogState();
}

class _StartRouteDialogState extends State<StartRouteDialog> {
  @override
  Widget build(BuildContext context) {}
}
