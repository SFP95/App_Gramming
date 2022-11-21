

import 'dart:convert';


Question questionsLoadFromJson(String str) {
  final jsonData = json.decode(str);
  return Question.fromJson(jsonData);
}

String questionsToJson(Question q) {
  final dyn = q.toJson();
  return json.encode(dyn);
}

class QuestionData{
  late List<Question> question;

  QuestionData({
    required this.question
});
  factory QuestionData.fromJson(Map<String,dynamic> json) => new QuestionData(
  question: new List<Question>.from(
  json['question'].map((x)=> Question.fromJson(x))
  )
  );
  Map<String, dynamic> toJson() => {
    'question':
        new List<dynamic>.from(question).map((x)=> x.toJson())
  };
}

class Question{

  late String quest;
  late String answ;

  Question({
    required this.quest,
    required this.answ
  });

 factory Question.fromJson(Map<String, dynamic> json) => new Question(
     quest: json['qID'],
     answ: json['question']
 );



 Map<String,dynamic> toJson() => {
   'qID': quest,
  'question': answ,
 };
 
 
/*late String TypeQuestion;
  late String question="Resolve: \n";
  late String answer;
  //late String answer2;
  List<String> options=[];
  String select="Skypped";
  bool correct=false;

  Question({
    required this.TypeQuestion,
    required this.answer
});
  
  factory Question.fromJson(Map<String, dynamic> json){
    return Question(
        TypeQuestion: json['question'].toString(),
        answer: json['answer'].toString()
    );
  }

       // answer2=json['answer2'];

  void addOptions(List<String> newOptions){
    question += TypeQuestion;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }*/
}
