import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    required this.userChoices,
    required this.restartQuiz,
    super.key,
  });

  final List<String> userChoices;
  final void Function() restartQuiz;

  List<Map<String, Object>> getQuizSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < userChoices.length; i++) {
      summary.add({
        "question_number": i,
        "question": questions[i].questionText,
        "correct_choice": questions[i].choices[0],
        "user_choice": userChoices[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getQuizSummary();
    final totalQuestions = questions.length;
    final numCorrectQuestions =
        summaryData.where((question) {
          return question['correct_choice'] == question['user_choice'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $totalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 229, 84, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35),
            Summary(summaryData: summaryData),
            SizedBox(height: 15),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                iconColor: Colors.white,
              ),
              onPressed: restartQuiz,
              label: Text(
                "Restart Quiz!",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              icon: Icon(Icons.restart_alt_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
