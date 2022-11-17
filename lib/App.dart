import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Views/LogoWait.dart';
import 'home_views/Home.dart';


class App extends StatelessWidget{
  App ({Key?key}):super (key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/splashView',
      routes: {
        '/home': (context) => Home(),
        //'/loginView': (context) => LoginView(),
        '/logoWait': (context) => LogoWait("assets/images/LogoGraming3.png"),
      },
    );
  }
}