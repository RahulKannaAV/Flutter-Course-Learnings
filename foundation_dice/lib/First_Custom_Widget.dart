import 'package:flutter/material.dart';
import 'package:foundation_dice/main_text.dart';
import 'package:foundation_dice/Dice_Roller_SF.dart';

const startAlign = Alignment.topLeft;
const endAlign = Alignment.bottomRight;

class FirstCustomWidget extends StatelessWidget {
  const FirstCustomWidget({required this.colorList, super.key});

  final List<Color> colorList;

  @override
  Widget build(context) {
    return (Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: startAlign,
          end: endAlign,
        ),
      ),
      child: Center(child: DiceRollerSF()),
    ));
  }
}
