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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      child:  Text('PREGUNTA 1',style: Theme.of(context).textTheme.headline1),
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (_, index) {
                    return Container(
                      margin:  const EdgeInsets.all(9),
                      decoration:  BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurpleAccent,width: 2),
                        borderRadius: BorderRadius.circular(15),
                        
                      ),
                      child: ListTile(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15),
                          ),
                        ),
                        leading: Text('${index + 1}',
                            style: Theme.of(context).textTheme.bodyText1),
                        title: Text('Respuesta',style: Theme.of(context).textTheme.headline2),
                        onTap: (){

                        },
                      ),
                    );
                    },
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {  },
            child: const Text('Skip'),
          ),
        ],
      ),
    );
  }
}