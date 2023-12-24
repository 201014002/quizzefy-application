import 'package:quizzefy/main.dart';

class Questions{
  late String questionsText;
  late bool questionsAnswers;
  Questions({String q='Welcome',bool a=true}){
    questionsText=q;
    questionsAnswers=a;
  }
}