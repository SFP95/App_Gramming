import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ReviewPage extends StatefulWidget{
  const ReviewPage({Key? key}) : super (key:key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  Future<void> readJson() async{
    final String response = await rootBundle.loadString('assets/QuestionsQuiz.json');
    final List<String> data = await json.decode(response);
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
      body: Column(
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
              child: Text('Questions',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) {
                  return Card(
                    color: Theme
                        .of(context)
                        .primaryColorLight,
                    child: ListTile(
                      leading: Text('leading'),
                      title: Text('title'),
                      trailing: Text('trailing'),
                    ),
                  );
                },
              )
          ),
        ],
      ),
    );
  }
}