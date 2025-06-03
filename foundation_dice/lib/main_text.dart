import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  MainText(this.outputText, {super.key});

  String outputText;

  @override
  Widget build(context) {
    return (Text(
      outputText,
      style: const TextStyle(color: Colors.white, fontSize: 28),
    ));
  }
}
