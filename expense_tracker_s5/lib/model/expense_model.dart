import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

const uuidObject = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, leisure, travel, work }

final categoryIconsMap = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
};

class ExpenseModel {
  ExpenseModel({
    required this.amount,
    required this.title,
    required this.expenseDate,
    required this.expenseCategory,
  }) : expenseID = uuidObject.v4();

  final String expenseID;
  final String title;
  final double amount;
  final DateTime expenseDate;
  final Category expenseCategory;

  String get formattedDate {
    return formatter.format(expenseDate);
  }
}
