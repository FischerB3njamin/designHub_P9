import "answer.dart";

class Question {
  String question;
  Type type;
  List<String>? possibleAnswer;
  List<Answer>? answers;

  Question(
      {required this.question,
      required this.type,
      this.possibleAnswer,
      this.answers});

  void showQuestion() {}
}

enum Type { open, close }
