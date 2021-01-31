import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String title;
  final bool isPassword;
  TextEditingController fieldController = new TextEditingController();

  InputField({Key key, this.title, this.isPassword, this.fieldController})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: widget.fieldController,
            obscureText: widget.isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.indigo,
              filled: true,
              prefixIcon: widget.isPassword == true
                  ? Icon(Icons.lock)
                  : Icon(Icons.person),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor introduzca los siguites campos';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
