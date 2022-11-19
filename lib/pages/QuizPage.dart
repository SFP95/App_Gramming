import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gramming/clases/Question.dart';
import 'package:gramming/clases/Quiz.dart';

class QuizPage extends StatefulWidget{
  const QuizPage({Key? key}) : super (key:key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int totalQuiz=5;
  int totalOps=4;
  int questionsIndex = 0;
  int progressIndex = 0;

  Quiz quiz = Quiz(name: 'Quizs', quiestions: []);

  Future<void> readJson() async{
    final String response = await rootBundle.loadString('assets/QuestionsQuiz.json');
    final List<String> data = await json.decode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded=[];

    while(true){
      optionList.shuffle();
      int answer =optionList[0];
      if(questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<String> otherOptions=[];
      for(var op in optionList.sublist(1,totalOps)){
        otherOptions.add(data[op][answer]); // no m escoje 'answer' por algún motivo
      }

      Question question = Question.fromJson(data[answer]);
      question.addOptions(otherOptions);
      quiz.quiestions.add(question);

      if(quiz.quiestions.length>= totalQuiz) break;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        elevation: 0,
        title:  Text(quiz.name),
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
              child:  quiz.quiestions.isNotEmpty ? Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      child:  Text(quiz.quiestions[questionsIndex].question,style: Theme.of(context).textTheme.headline1),
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: totalOps,
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
                        title: Text(quiz.quiestions[questionsIndex].options[index],style: Theme.of(context).textTheme.headline2),
                        onTap: (){

                        },
                      ),
                    );
                    },
                    ),
                    ),
                  ],
                ),
              ):const CircularProgressIndicator(
                backgroundColor: Colors.deepPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {  },
            child:  Text('Skip',
              style: Theme.of(context).textTheme.bodyText1),
          ),
        ],
      ),
    );
  }
}