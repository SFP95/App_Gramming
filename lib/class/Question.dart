class Question{
  late String TypeQuestion;
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
  }
}