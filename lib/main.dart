import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           home : Scaffold(
             appBar: AppBar(
               title: Center(
                 child: Text('Ans the question???',
                 style: TextStyle(color: Colors.white),),
               ),
               backgroundColor: Colors.black,
             ),
             backgroundColor: Colors.white,
             body: SafeArea(
               child: Padding(
                 padding:EdgeInsets.symmetric(horizontal: 15.0),
                 child: QuizPage(),
               ),
              ),
             ),
           );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer){
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      }
      else {
        if (userAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding:  EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                  quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 25
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: Colors.green,
                child: TextButton(
                  child: Text('True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  onPressed: (){
                      checkAnswer(true);
                   setState(() {
                     quizBrain.nextQuestion();
                   });
                  },
               ),
              ),
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.red,
              child: TextButton(
               child: Text('False',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                 ),
               ),
              onPressed: (){
                checkAnswer(false);
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
             ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}



