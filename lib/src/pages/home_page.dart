import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:provider/provider.dart';
import 'package:proyecto_final_whats_app/main.dart';
import 'package:proyecto_final_whats_app/src/pages/chat_page.dart';
import 'package:proyecto_final_whats_app/src/pages/map_page.dart';
import 'package:proyecto_final_whats_app/src/providers/routes.dart';
import 'package:proyecto_final_whats_app/src/widgets/home/bottomAppbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  Future<bool> backButtonPressed() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Desea salir de la aplicacion?',
      desc: '',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        SystemNavigator.pop();
      },
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backButtonPressed,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              ChatPage(),
              Container(),
              MapPage(),
            ],
          ),
          bottomNavigationBar: Bottom_App_Bar(controller: controller)),
    );
  }
}
