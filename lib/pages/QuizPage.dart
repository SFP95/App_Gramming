import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget{
  const QuizPage({Key? key}) : super (key:key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        elevation: 0,
        title: const Text('QUIZs'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
                child: LinearProgressIndicator(
                  color: Colors.deepPurpleAccent.shade400,
                  value: .5,
                  minHeight: 20,
                )
            ),
          ),
          Container(),
          TextButton(
            onPressed: () {  },
            child: const Text('Skip'),
          ),
        ],
      ),
    );
  }
}