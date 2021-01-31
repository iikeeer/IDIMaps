import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:proyecto_final_whats_app/src/data/login.dart';
import 'package:proyecto_final_whats_app/src/logs/logs.dart';
import 'package:proyecto_final_whats_app/src/pages/constants.dart';
import 'package:proyecto_final_whats_app/src/pages/home_page.dart';

class LoginScreen extends StatelessWidget {
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

    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return FlutterLogin(
      title: "LOGIN",
      emailValidator: (value) {
        if (value.isEmpty) {
          return "Introduce un usuario valido";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return "La contraseña esta vacia";
        }
        return null;
      },
      onLogin: (LoginData data) {
        loginFunction(data.name, data.password);
      },
      // onSignup: () {

      //       },
    );
  }
}
