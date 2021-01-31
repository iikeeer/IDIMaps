import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/inputField.dart';
import 'package:proyecto_final_whats_app/src/widgets/login/loginButton.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameFieldController = new TextEditingController();
  TextEditingController passwordFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      //autovalidateMode: AutovalidateMode.always,
      key: formKey,
      child: Column(
        children: <Widget>[
          InputField(
            title: "Usuario",
            isPassword: false,
            fieldController: usernameFieldController,
          ),
          InputField(
            title: "Contraseña",
            isPassword: true,
            fieldController: passwordFieldController,
          ),
          LoginButton(
            formKey: formKey,
            usernameFieldController: usernameFieldController,
            passwordFieldController: passwordFieldController,
          ),
        ],
      ),
    );
  }
}

