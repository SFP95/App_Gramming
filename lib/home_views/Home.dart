import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super (key:key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple[100],
      ),
      body: Center(child: Text('Home Page')),
    );
  }

}