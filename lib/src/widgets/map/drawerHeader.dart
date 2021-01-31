import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class DrawerHeaderWidget extends StatefulWidget {
  DrawerHeaderWidget({Key key}) : super(key: key);

  @override
  _DrawerHeaderWidgetState createState() => _DrawerHeaderWidgetState();
}

class _DrawerHeaderWidgetState extends State<DrawerHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        globals.name,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      accountEmail: Text(
        globals.email,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        //onBackgroundImageError: ,
        backgroundImage: NetworkImage(
            "https://images.mediotiempo.com/yzD9ow__bc4WG8nndZDGXcXK0C4=/0x530/uploads/media/2019/11/21/baby-yoda-es-lo-mas-8.jpg"),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(globals.assetsPathImages + '/routes.jpg'),
        ),
      ),
    );
  }
}
