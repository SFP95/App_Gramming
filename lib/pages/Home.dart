import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super (key:key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent[100],
      ),
      body: Center(
          child:Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30,bottom: 50),
                child:
                const Image(
                    image: AssetImage('assets/images/logo.png')),
                //   Icon(
                //     Icons.school,
                //     size: 100,
                //     color: Colors.deepPurple[700],
                //   ),
              ),
              Card(
                margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.deepPurple.shade300,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 10, bottom: 25,right: 10,left: 10),
                      child: const Center(
                        child: Text('QUIZ APP', style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          color: Colors.black54,
                        )),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.deepPurple.shade600,
                              Colors.deepPurple.shade100,
                              Colors.deepPurple.shade100,
                              Colors.deepPurple.shade100,
                              Colors.deepPurple.shade600,
                            ]
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/QuizPage');
                      },
                      child: const Text('Start Quiz', style: TextStyle(fontSize: 30)),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade100,
                        elevation: 4,
                        side: const BorderSide(width: 1),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/ReviewPage');
                      },
                      child: const Text('Review Quiz', style: TextStyle(fontSize: 30)),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade100,
                          elevation: 4,
                          side: const BorderSide(width: 1)
                      ),),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

}