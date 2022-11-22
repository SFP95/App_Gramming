import 'dart:convert';

class Question {
  late String question;
  late String answer;

  Question({
    required this.question,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    answer: json["answer"],
  );

  get options => null;

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
  };
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