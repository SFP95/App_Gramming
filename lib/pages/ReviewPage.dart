import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
  int totalQuiz=5;
  int totalOps=4;
  late Quiz quiz=Quiz(name: 'Quiz', questions: []);

  Future<void> readQuestionsAndAnwersJson() async {
    // final response = await http.get(Uri.parse('assets/q&a.json'));

    final String response = await rootBundle.loadString('assets/q&a.json');
    final List<dynamic> data = await json.decode(response);
    List<dynamic> optionList = List<dynamic>.generate(data.length, (i) => i);
    List<dynamic> questionsAdded = [];

    while (true) {
      optionList.shuffle();
      int answer = optionList[0];
      if (questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<String> otherOptions = [];
      for (var option in optionList.sublist(1, totalOps)) {
        otherOptions.add(data[option]['capital']);
      }

      Question question = Question.fromJson(data[answer]);
      question.addOptions(otherOptions);
      quiz.questions.add(question);

      if (quiz.questions.length >= totalQuiz) break;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readQuestionsAndAnwersJson();
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