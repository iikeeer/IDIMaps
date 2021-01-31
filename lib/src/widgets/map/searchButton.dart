import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/widgets/dialog/filterDialog.dart';
import 'package:proyecto_final_whats_app/src/widgets/dialog/finishRouteDialog.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class SearchButton extends StatefulWidget {
  SearchButton({Key key}) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      width: 60,
      icon: Icons.search,
      text: "",
      //color: Colors.blueGrey,
      pressEvent: () {
        if (globals.ruta_iniciada == false) {
          globals.loc = null;
          globals.trans = null;
          FilterRouteDialog().filterRoute(context);
        } else {
          FinishRouteDialog().finishRoute(context);
        }
      },
    );
  }
}
