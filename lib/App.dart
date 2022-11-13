import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_views/Home.dart';
import 'login_views/LogoWait.dart';

class App extends StatelessWidget{
  App ({Key?key}):super (key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/splashView',
      routes: {
        '/home': (context) => Home(),
        //'/loginView': (context) => LoginView(),
        '/logoWait': (context) => LogoWait("assets/images/.."),
      },
    );
  }
}