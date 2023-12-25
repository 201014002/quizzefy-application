import 'package:quizzefy/questions.dart';

int _questionNumber = 0;

class QuizLogic {
  List<Questions> _questionSets = [
    Questions( 'All introverts are shy and socially anxious.',false),
    Questions( 'Peanuts are not nuts!',true),
    Questions( 'A credit card and a debit card are the same.',false),
    Questions('SizedBox is a widget that allows us to have a specified height or width between two related widgets.',
        true),
    Questions( 'Google started developing Flutter back in 2015.',true),
    Questions('Flutter programs aren\'t written in Google\'s own Dart programming language.',false),
    Questions('Keys are used in Flutter to uniquely identify widgets, elements, and SemanticsNodes.',true),
    Questions('Firebase database allows for access to a cloud-based database provider for Flutter applications.',
        true),
    Questions('There are three types of widgets available to developers in Flutter.',false),
    Questions('An experienced Flutter developer doesn\'t need to know platform native languages or tools to build apps.', false),
    Questions('In Canada dart language is very popular.',false),
    Questions('Due to iOS restrictions on dynamic code execution Flutter apps must use AOT compilation on the iOS platform.', true),
    Questions('File pubspec.yaml lives at the base of a Flutter project and provides the necessary configuration and setup to build Flutter apps.',true),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionSets.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText(int questionNumber) {
    return _questionSets[_questionNumber].questionsText;
  }

  bool getRightAnswer(int questionNumber) {
    return _questionSets[_questionNumber].questionsAnswers;
  }

  bool isCompleted() {
    if (_questionNumber >= _questionSets.length - 1) {
      // A print statement to check that isCompleted is returning true when user is at the end of the quiz and a restart must happen.
      print('Returns true');
      return true;
    } else {
      return false;
    }
  }
  // reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}
