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
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.deepPurpleAccent.shade400,
            fontSize: 30,
            fontWeight:  FontWeight.w500,
            shadows: [
              Shadow(
               color: Colors.deepPurpleAccent.shade400.withOpacity(.3),
                offset: const Offset(3, 3),
                blurRadius: 5,
              )
            ]
          ),
          headline2: TextStyle(
              color: Colors.deepPurpleAccent.shade200,
              fontSize: 20,
          ),
          headline3: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          bodyText1: TextStyle(
            color: Colors.deepPurpleAccent.shade700,
            fontSize: 18,
          )
        ),
        cardTheme: CardTheme(
          elevation: 6,
          color: Colors.deepPurple.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )
        ),
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