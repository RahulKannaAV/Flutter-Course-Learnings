import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton(this.choiceText, this.onTap, {super.key});
  final String choiceText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return OutlinedButton(
      onPressed: onTap,

      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all<Size>(Size.fromWidth(250)),
        backgroundColor: WidgetStateProperty.all<Color>(
          const Color.fromARGB(255, 8, 23, 107),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
      child: Text(choiceText, textAlign: TextAlign.center),
    );
  }
}
