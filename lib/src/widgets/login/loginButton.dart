import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;
import 'dart:async';
import 'package:animated_button/animated_button.dart';
import 'package:proyecto_final_whats_app/src/data/login.dart';
import 'package:proyecto_final_whats_app/src/logs/logs.dart';
import 'package:proyecto_final_whats_app/src/pages/home_page.dart';
import 'package:proyecto_final_whats_app/src/widgets/dialog/errorDialog.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  TextEditingController usernameFieldController = new TextEditingController();
  TextEditingController passwordFieldController = new TextEditingController();

  LoginButton(
      {Key key,
      this.formKey,
      this.usernameFieldController,
      this.passwordFieldController})
      : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    loginFunction(String username, String password) async {
      Login login = new Login(
        username: username,
        password: password,
      );

      try {
        bool data = await login.login();
        GlobalVars().isLogged();
        if (data) {
          print("SUCCED DIALOG");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          print("ERROR DIALOG");
          //ErrorDialog();
        }
      } catch (e) {
        print(e);
      }
    }

    return AnimatedButton(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 10,
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        if (widget.formKey.currentState.validate()) {
          GlobalVars().loginFieldsData(
            widget.usernameFieldController.text,
            widget.passwordFieldController.text,
          );

          loginFunction(
            widget.usernameFieldController.text,
            widget.passwordFieldController.text,
          );
        }
      },
      shadowDegree: ShadowDegree.light,
      color: Colors.indigo,
    );
  }
}
