import 'dart:convert';

class Question {
  late String question;
  late String answer;

  Question({
    required this.question,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Welcome(
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
  };
}
