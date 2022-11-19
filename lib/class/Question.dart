class Question{
  late String TypeQuestion;
  String question="Resolve: \n";
  late String answer;
  //late String answer2;
  List<String> options=[];
  String select="Skypped";
  bool correct=false;

  Question.fromJson(Map<String, dynamic> json)
      : question= json['question'],
        answer=json['answer'];
       // answer2=json['answer2'];

  void addOptions(List<String> newOptions){
    question += TypeQuestion;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }
}