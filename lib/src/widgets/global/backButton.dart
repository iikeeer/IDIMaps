import 'package:flutter/material.dart';


class Back_Button extends StatefulWidget {
  Back_Button({Key key}) : super(key: key);

  @override
  _Back_ButtonState createState() => _Back_ButtonState();
}

class _Back_ButtonState extends State<Back_Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 0,
                top: 10,
                bottom: 10,
              ),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 28,
              ),
            ),
            Text(
              'Back',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}