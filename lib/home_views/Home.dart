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
                 //   Image(image: FileImage('assets/images/LogoGraming1.png'))
                Icon(
                  Icons.school,
                  size: 100,
                  color: Colors.deepPurple[700],
                ),
              ),
              Card(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          height: 50,
                          margin: const EdgeInsets.only(top: 10, bottom: 25),
                          child: const Center(
                            child: Text('QUIZ APP', style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),),
                          ),  
                        ),
                        OutlinedButton(
                            onPressed: (){}, 
                            child: const Text('Boton'),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade100,
                            elevation: 4,
                            side: const BorderSide(width: 1)
                          ),
                        ),
                        OutlinedButton(
                            onPressed: (){},
                            child: const Text('Boton'),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade100,
                              elevation: 4,
                              side: const BorderSide(width: 1)
                          ),),
                        OutlinedButton(
                            onPressed: (){},
                            child: const Text('Boton'),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade100,
                              elevation: 4,
                              side: const BorderSide(width: 1)
                          ),
                        ),
                        OutlinedButton(
                            onPressed: (){},
                            child: const Text('Boton'),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade100,
                              elevation: 4,
                              side: const BorderSide(width: 1)
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          )
      ),
    );
  }

}