import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/main_screen.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  // Using ternary operator
  var activeScreenWidget = 'main-screen';
  final List<String> chosenChoices = [];

  void registerChosenChoice(String choice) {
    print(chosenChoices);
    chosenChoices.add(choice);

    if (chosenChoices.length == questions.length) {
      setState(() {
        activeScreenWidget = 'result-screen';
      });
    }
  }

  void changeScreen() {
    setState(() {
      activeScreenWidget = 'questions-screen';
    });
  }

  void restartQuizFunction() {
    setState(() {
      chosenChoices.clear();
      activeScreenWidget = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenHolder = MainScreen(changeScreen);

    if (activeScreenWidget == 'questions-screen') {
      screenHolder = QuestionsScreen(onSelectChoice: registerChosenChoice);
    } else if (activeScreenWidget == 'result-screen') {
      screenHolder = ResultScreen(
        userChoices: chosenChoices,
        restartQuiz: restartQuizFunction,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenHolder,
        ),
      ),
    );
  }
}
