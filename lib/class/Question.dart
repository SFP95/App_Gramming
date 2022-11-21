import 'dart:convert';

class Welcome {
  late String question;
  late String answer;


  Welcome({
    required this.question,
    required this.answer,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
  };
}
