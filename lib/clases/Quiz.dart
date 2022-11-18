import 'Question.dart';

class Quiz {
  String name;
  List<Question> quiestions;
  int rifgt=0;

  Quiz({required this.name, required this.quiestions});

  double get percent => (rifgt/quiestions.length)*100;
}