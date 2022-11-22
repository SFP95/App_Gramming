import 'dart:convert';

class Question {
  late String question;
  late String answer;
  List<String> options = [];
  bool correct = false;
  String selected = 'Skipped';

  Question({
    required this.question,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    answer: json["answer"],
  );


  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
  };

  void addOptions(List<String> newOptions) {
    question += answer;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }
}
/**
 * class Question {
    late String country;
    String question = "Capital de: ";
    late String answer;
    List<String> options = [];
    String selected = 'Skipped';
    bool correct = false;

    Question.fromJson(Map<String, dynamic> json)
    : country = json['country'],
    answer = json['capital'];

    void addOptions(List<String> newOptions) {
    question += country;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
    }
    }
 */