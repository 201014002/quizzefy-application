import 'package:flutter/material.dart';

void main() {
  runApp(Quizzefy());
}

class Quizzefy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent[100],
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
        ),
      ),
    );
  }
}
