import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final_whats_app/src/pages/chat_page.dart';
import 'package:proyecto_final_whats_app/src/pages/home_page.dart';
import 'package:proyecto_final_whats_app/src/pages/login_page.dart';
import 'package:proyecto_final_whats_app/src/pages/map_page.dart';
import 'package:proyecto_final_whats_app/src/providers/routes.dart';
import 'package:proyecto_final_whats_app/src/routes/routes.dart';
import 'package:proyecto_final_whats_app/src/widgets/art/transition_route_observer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MapRoutes(),
        ),
      ],
      child: MaterialApp(
        title: 'NavigationDrawer Demo',
        theme: ThemeData(
          // brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.orange,
          cursorColor: Colors.orange,
          // fontFamily: 'SourceSansPro',
          textTheme: TextTheme(
            display2: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 45.0,
              // fontWeight: FontWeight.w400,
              color: Colors.orange,
            ),
            button: TextStyle(
              // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
              fontFamily: 'OpenSans',
            ),
            caption: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.deepPurple[300],
            ),
            display4: TextStyle(fontFamily: 'Quicksand'),
            display3: TextStyle(fontFamily: 'Quicksand'),
            display1: TextStyle(fontFamily: 'Quicksand'),
            headline: TextStyle(fontFamily: 'NotoSans'),
            title: TextStyle(fontFamily: 'NotoSans'),
            subhead: TextStyle(fontFamily: 'NotoSans'),
            body2: TextStyle(fontFamily: 'NotoSans'),
            body1: TextStyle(fontFamily: 'NotoSans'),
            subtitle: TextStyle(fontFamily: 'NotoSans'),
            overline: TextStyle(fontFamily: 'NotoSans'),
          ),
        ),
        debugShowCheckedModeBanner: false,
        //home: WelcomePage(),
        home: LoginScreen(),
        navigatorObservers: [TransitionRouteObserver()],
        routes: {
          routes.home: (context) => HomePage(),
          routes.chat: (context) => ChatPage(),
          routes.map: (context) => MapPage(),
        },
      ),
    );
  }
}
