import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screenWidget;
    switch (activeScreen) {
      case 'start-screen':
        screenWidget = StartScreen(switchScreen);
        break;
      case 'questions-screen':
        screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
        break;
      case 'results-screen':
        screenWidget = ResultsScreen(
          chosenAnswers: selectedAnswers,
          restartQuiz: restartQuiz,
        );
        break;
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple.shade900,
        body: screenWidget,
      ),
    );
  }
}
