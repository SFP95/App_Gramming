import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget{
  const ReviewPage({Key? key}) : super (key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        elevation: 0,
        title: const Text('QUIZ'),
      ),
      body: const Center(
        child: Text('REVIEW QUIZ'),
      ),
    );
  }
}