import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  MainScreen(this.changeFn, {super.key});

  void Function() changeFn;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 325,
          color: const Color.fromARGB(120, 255, 255, 255),
        ),
        SizedBox(height: 50),
        Center(
          child: Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(fontSize: 25, color: Colors.white),
          ),
        ),
        SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: changeFn,
          icon: Icon(Icons.arrow_circle_right_rounded, color: Colors.white),
          label: Text("Start Quiz", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
