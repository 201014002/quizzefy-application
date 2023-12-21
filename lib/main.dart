import 'package:flutter/material.dart';

void main() {
  runApp(Quizzefy());
}

class Quizzefy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  List<Icon> scoreKeeper=[];
  List<String> questions=['All introverts are shy and socially anxious.','Peanuts are not nuts!','A credit card and a debit card are the same.'];
  int questionNumber=0;
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
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
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
                  backgroundColor: Colors.green[800],
                ),
                onPressed: () {
                 //the user picked true
                  setState(() {
                    questionNumber++;
                  });
                },
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 30.0, color: Colors.white,fontFamily: 'Poppins',fontWeight:FontWeight.w600),
                ),
              )),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red[800],
                ),
                onPressed: () {
                  //the user picked false
                  setState(() {
                    questionNumber++;
                  });

                },
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 30.0, color: Colors.white,fontFamily: 'Poppins',fontWeight:FontWeight.w600),
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
