import 'package:flutter/material.dart';
import 'package:quizzefy/quiz_logic.dart';
import'package:rflutter_alert/rflutter_alert.dart';
QuizLogic quizLogic = QuizLogic();
void main() {
  runApp(Quizzefy());
}

class Quizzefy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: QuizPaage(),
          ),
        ),
      ),
    );
  }
}

class QuizPaage extends StatefulWidget {
  @override
  State<QuizPaage> createState() => _QuizPaageState();
}

class _QuizPaageState extends State<QuizPaage> {
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userChosedAnswer) {
    bool rightAnswer = quizLogic.getRightAnswer(1);
    setState(() {
      if(quizLogic.isCompleted()==true){
        Alert(
          context: context,
          title: 'Quiz is Finished!',
          desc: 'You\'ve reached at the end of this quiz.',
        ).show();
        //Reset the _questionNmuber
        quizLogic.reset();
        //Make the scoreKeeper empty
        scoreKeeper = [];
      }else {
        if (userChosedAnswer == rightAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.lightGreen[600],
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.redAccent[400],
            ),
          );
        }
        quizLogic.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizLogic.getQuestionText(1),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightGreen[600],
                ),
                onPressed: () {
                  //the user picked true
                  checkAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
              )),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent[400],
                ),
                onPressed: () {
                  //the user picked false
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
              )),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
