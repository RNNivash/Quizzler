import 'question.dart';
class QuizBrain{
  int _questionNo = 0;
  final List <Questions> _questionBank = [
    Questions(q:'Java\'s "ArrayList" class is an example of a built-in data structure for storing collections of objects',a: true),
    Questions(q: 'The "finally" block in a try-catch-finally statement is optional',a: false),
    Questions(q: 'In Java, you can create a user-defined exception by extending the "Exception" class',a: true),
    Questions(q: 'Java allows multiple inheritance through class inheritance' ,a: false),
    Questions(q: 'The break statement is used to exit a loop or switch statement in Java' ,a: true ),
    Questions(q: 'Java automatically performs memory management and garbage collection' ,a: true),
    Questions(q: 'In Java, all variables must be explicitly declared with a data type before they can be used.' ,a: true),
    Questions(q: 'A Java class can inherit multiple classes using class inheritance' ,a: false),
    Questions(q: 'Java supports both call-by-value and call-by-reference for method parameter passing' ,a: false),
    Questions(q: 'Java allows the creation of pointers and direct memory manipulation' ,a: false),
    Questions(q: 'Java\'s HashMap class allows duplicate keys but not duplicate values' ,a: false),
    Questions(q: 'Java supports operator overloading, allowing you to define custom behaviors for operators like + and -' ,a: false),
    Questions(q: 'The StringBuilder class in Java is mutable, while the String class is immutable' ,a: true),
    Questions(q: 'The try block in a try-catch statement is optional, and you can have a catch block without a try block' ,a: false),
    Questions(q: 'The break statement is used to exit a loop or switch statement in Java' ,a: true),
  ];

  void nextQuestion() {
    if(_questionNo < _questionBank.length - 1){
      _questionNo++;
    }
  }


  String getQuestionText(){
    return _questionBank[_questionNo].questionText;
  }
  bool getAnswer(){
    return _questionBank[_questionNo].questionAns;
  }
  bool isFinished() {
    if (_questionNo >= _questionBank.length-1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }
  void reset() {
    _questionNo = 0;
  }
}
