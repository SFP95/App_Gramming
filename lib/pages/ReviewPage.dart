import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:gramming/class/Question.dart';
import 'package:gramming/class/Quiz.dart';

class ReviewPage extends StatefulWidget{
  const ReviewPage({Key? key}) : super (key:key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  late Quiz quiz=Quiz(name: 'Quiz', questions: []);

  Future<void> readJson() async{
    final String response = await rootBundle.loadString('assets/quiestions.json');
    final List<String> data = await json.decode(response);

    for (var item in data){
      Question question= Question.fromJson(jsonDecode(item));
      question.question += question.TypeQuestion;
      quiz.questions.add(question);
    }
    setState(() { });
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
        title: const Text('QUIZ'),
      ),
      body: quiz.questions.isNotEmpty ? Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(
                left: 8, right: 8, top: 2, bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 1,
                )
            ),
            child: Center(
              child: Text('Questions: ${quiz.questions.length}',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (_, index) {
                  return Card(
                    color: Theme
                        .of(context)
                        .primaryColorLight,
                    child: ListTile(
                      leading: Text('${index+1}'),
                      title: Text(quiz.questions[index].question),
                      trailing: Text(quiz.questions[index].answer),
                    ),
                  );
                },
              )
          ),
        ],
      ): const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}