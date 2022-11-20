import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gramming/pages/ResultPage.dart';
import '../class/Question.dart';
import '../class/Quiz.dart';

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

  Quiz quiz = Quiz(name: 'Quizs', questions: []);

  Future<void> readJson() async{
    final String response = await rootBundle.loadString('assets/quiestions.json');
    final List<String> data = await jsonDecode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded=[];

    while(true){
      optionList.shuffle();
      int answer =optionList[0];
      if(questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<String> otherOptions=[];

      for(var op in optionList){
        otherOptions.add(jsonDecode(data[op]['answer'])); // no me coge 'answer' por algún motivo
      }

      Question question = Question.fromJson(jsonDecode(data[answer])); // (data[answer]) no me tira
      question.addOptions(otherOptions);
      quiz.questions.add(question);

      if(quiz.questions.length>= totalQuiz) break;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void optionSelected(String selected){
    quiz.questions[questionsIndex].select= selected;
    if(selected== quiz.questions[questionsIndex].answer){
      quiz.questions[questionsIndex].correct == true;
      quiz.rifgt += 1;
    }

    progressIndex+1;

    if(questionsIndex< totalQuiz-1){
      questionsIndex+=1;
    }else{
      showDialog(
          context: context,
          builder: (BuildContext context) => buildResultDialog(context));
    }

    setState(() {});
  }

  Widget buildResultDialog (BuildContext context){
    return AlertDialog(
      title: Text('Results',style: Theme.of(context).textTheme.headline3,),
      backgroundColor: Theme.of(context).primaryColorDark,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Quizs : $totalQuiz",style: Theme.of(context).textTheme.bodyText1,),
          Text("Correct Quizs : $quiz.right",style: Theme.of(context).textTheme.bodyText1,),
          Text("Incorrect Quizs : ${totalQuiz - quiz.rifgt}",style: Theme.of(context).textTheme.bodyText1,),
          Text("Percent : ${quiz.percent} %",style: Theme.of(context).textTheme.bodyText1,),
        ],
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=> ResultPage(quiz: quiz,)));
            },
            child: Text('Close',style: Theme.of(context).textTheme.headline3,))
      ],
    );
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
                  value: progressIndex/totalQuiz,
                  minHeight: 20,
                )
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child:  quiz.questions.isNotEmpty ? Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      child:  Text(quiz.questions[questionsIndex].question,style: Theme.of(context).textTheme.headline1),
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
                        title: Text(quiz.questions[questionsIndex].options[index],style: Theme.of(context).textTheme.headline2),
                        onTap: (){
                          optionSelected(quiz.questions[questionsIndex].options[index]);
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
            onPressed: () { optionSelected('Skipped'); },
            child:  Text('Skip',
              style: Theme.of(context).textTheme.bodyText1),
          ),
        ],
      ),
    );
  }
}