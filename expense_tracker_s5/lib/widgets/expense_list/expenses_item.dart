import 'package:flutter/material.dart';
import 'package:expense_tracker_s5/model/expense_model.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expenseData, {super.key});

  final ExpenseModel expenseData;

  @override
  Widget build(context) {
    return Card(
      margin: EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),

        child: Column(
          children: [
            Text(expenseData.title),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('\u20B9 ${expenseData.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIconsMap[expenseData.expenseCategory]),
                    const SizedBox(width: 5),
                    Text(expenseData.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
