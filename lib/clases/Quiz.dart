import 'Question.dart';

class Quiz {
  String name;
  List<Question> questions;
  int rifgt=0;

  Quiz({required this.name, required this.quiestions});

  double get percent => (rifgt/quiestions.length)*100;
}