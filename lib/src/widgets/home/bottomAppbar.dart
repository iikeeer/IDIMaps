import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/pages/home_page.dart';
import 'package:proyecto_final_whats_app/src/widgets/dialog/filterDialog.dart';

class Bottom_App_Bar extends StatefulWidget {
  TabController controller;

  Bottom_App_Bar({Key key, this.controller}) : super(key: key);

  @override
  _Bottom_App_BarState createState() => _Bottom_App_BarState();
}

class _Bottom_App_BarState extends State<Bottom_App_Bar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      buttonBackgroundColor: Color.fromRGBO(47, 136, 253, 1),
      color: Color.fromRGBO(47, 136, 253, 1),
      animationCurve: Curves.easeInOutCirc,
      items: <Widget>[
        Icon(
          Icons.chat,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.emoji_events,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.map,
          size: 30,
          color: Colors.white,
        ),
      ],
      onTap: (index) {
        index == 0
            ? widget.controller.index = 0
            : index == 1
                ? widget.controller.index = 1
                : widget.controller.index = 2;
      },
      height: 45,
    );
  }
}
