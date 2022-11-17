import 'package:flutter/material.dart';
import 'package:gramming/home_views/Home.dart';

void main () {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamming',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home()
    );
  }

}