import 'package:flutter/material.dart';

class Divider_Or extends StatefulWidget {
  Divider_Or({Key key}) : super(key: key);

  @override
  _Divider_OrState createState() => _Divider_OrState();
}

class _Divider_OrState extends State<Divider_Or> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
