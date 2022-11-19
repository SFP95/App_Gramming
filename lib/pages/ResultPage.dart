import 'package:flutter/material.dart';
import 'package:gramming/class/Quiz.dart';

class ResultPage extends StatelessWidget{

  final Quiz quiz;

  const ResultPage({Key? key, required this.quiz}): super( key :key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }

}