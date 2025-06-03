import 'package:flutter/material.dart';
import 'dart:math';

class DiceRollerSF extends StatefulWidget {
  const DiceRollerSF({super.key});

  @override
  State<DiceRollerSF> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRollerSF> {
  String diceImagePath = 'assets/images/dice-2.png';

  void performDiceRoll() {
    int nextNumber = Random().nextInt(6) + 1;
    setState(() {
      diceImagePath = 'assets/images/dice-$nextNumber.png';
    });

    print("Clicked");
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(diceImagePath, width: 250),
        SizedBox(height: 25),
        OutlinedButton(
          onPressed: performDiceRoll,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          child: Text('Click me', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
