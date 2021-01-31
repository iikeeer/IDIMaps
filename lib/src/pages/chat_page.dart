import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final_whats_app/src/pages/map_page.dart';
import 'package:proyecto_final_whats_app/src/providers/routes.dart';

class ChatPage extends StatefulWidget {
  //Ruta para el provider
  static const String routeName = '/ChatPage';
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    //Provider
    final routesProvider = Provider.of<MapRoutes>(context);

    return Text("Chat");
  }
}
