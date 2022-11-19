import 'Question.dart';

class Quiz {
  String name;
  List<Question> questions;
  int rifgt=0;

  Quiz({required this.name, required this.questions});

  double get percent => (rifgt/questions.length)*100;
}