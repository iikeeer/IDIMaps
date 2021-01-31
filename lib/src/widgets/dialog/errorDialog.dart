import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatefulWidget {
  ErrorDialog({Key key}) : super(key: key);

  void errorDialog(context) {
    AwesomeDialog dialogB;
    dialogB = AwesomeDialog(
      dialogType: DialogType.ERROR,
      context: context,
      width: 280,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Error',
      desc: 'Algo va mal',
      showCloseIcon: true,
      btnOkOnPress: () {
        dialogB.dissmiss();
      },
    )..show();
  }

  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {}
}
