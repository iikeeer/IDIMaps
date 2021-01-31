import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/widgets/dialog/detallesDialog.dart';
import 'package:proyecto_final_whats_app/src/widgets/dialog/errorDialog.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/autocompleteTextField.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;
import 'package:proyecto_final_whats_app/src/widgets/map/googleMap.dart';

class FinishRouteDialog extends StatefulWidget {
  FinishRouteDialog({Key key}) : super(key: key);
  AutoCompleteTextField searchTextField;
  TextEditingController controllerL = new TextEditingController();

  void finishRoute(context) {
    AwesomeDialog dialog;
    dialog = AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      headerAnimationLoop: false,
      keyboardAware: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              'Estas en una ruta, deseas acabarla ?',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                AnimatedButton(
                  width: MediaQuery.of(context).size.width / 3,
                  color: Colors.green,
                  text: 'Aceptar',
                  pressEvent: () {
                    globals.ruta_iniciada = false;
                    dialog.dissmiss();
                  },
                ),
                AnimatedButton(
                  width: MediaQuery.of(context).size.width / 3,
                  color: Colors.red,
                  text: 'Cancelar',
                  pressEvent: () {
                    dialog.dissmiss();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    )..show();
  }

  @override
  _FilterRouteDialogState createState() => _FilterRouteDialogState();
}

class _FilterRouteDialogState extends State<FinishRouteDialog> {
  @override
  Widget build(BuildContext context) {}
}
