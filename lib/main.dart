import 'package:flutter/material.dart';
import 'package:gramming/pages/Home.dart';
import 'package:gramming/pages/QuizPage.dart';
import 'package:gramming/pages/ReviewPage.dart';

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
      initialRoute: '/',
      routes:{
        '/':(context) => const Home(),
        '/QuizPage':(context) => const QuizPage(),
        '/ReviewPage':(context) => const ReviewPage(),
      },
    );
  }

}