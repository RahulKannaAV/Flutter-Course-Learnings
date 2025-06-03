import 'package:flutter/material.dart';
import 'package:foundation_dice/First_Custom_Widget.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: FirstCustomWidget(
          colorList: [Colors.purple, Colors.blue, Colors.red],
        ),
      ),
    ),
  );
}
