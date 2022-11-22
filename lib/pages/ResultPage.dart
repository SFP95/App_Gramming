import 'package:flutter/material.dart';
import 'package:gramming/class/Quiz.dart';

class ResultPage extends StatelessWidget{

  final Quiz quiz;

  const ResultPage({Key? key, required this.quiz}): super( key :key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        elevation: 0,
        title:  Text(quiz.name),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding:  const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 2,right: 2,top: 2,bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple.shade100,
                  width: 1,
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Quizs: ${quiz.questions.length}',
                    style: Theme.of(context).textTheme.headline4,),
                  Text('Corrects: ${quiz.percent} %',
                    style: Theme.of(context).textTheme.headline4,),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: quiz.questions.length,
                    itemBuilder: (_,index){
                      return Card(
                        color: quiz.questions[index].correct ? Colors.green.shade300 : Colors.red.shade300,
                        child: ListTile(
                          leading: quiz.questions[index].correct ?
                          Icon(Icons.check,
                            color: Colors.green.shade700) :
                          Icon(Icons.close,
                              color: Colors.red.shade700),
                        title: Text(quiz.questions[index].question),
                          subtitle: Text(quiz.questions[index].selected),
                          trailing: Text(quiz.questions[index].answer),
                        ),
                        );
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }

}