import 'package:flutter/material.dart';
import 'package:quiz_app/choice_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectChoice, super.key});

  final void Function(String answer) onSelectChoice;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;

  void changeQuestion(String choiceText) {
    widget.onSelectChoice(
      choiceText,
    ); // Adding the choice to the selected choices list
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    final QuizQuestion currentQuestion = questions[questionIndex];

    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Center(
            child: Text(
              currentQuestion.questionText,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 43, 44, 46),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          SizedBox(height: 30),

          ...currentQuestion.getShuffledList().map((choice) {
            return ChoiceButton(choice, () {
              changeQuestion(choice);
            });
          }),
        ],
      ),
    );
  }
}
