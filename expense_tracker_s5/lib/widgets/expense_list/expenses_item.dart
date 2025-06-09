import 'package:flutter/material.dart';
import 'package:expense_tracker_s5/model/expense_model.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expenseData, {super.key});

  final ExpenseModel expenseData;

  @override
  Widget build(context) {
    return Card(
      margin: Theme.of(context).cardTheme.margin,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Text(
              expenseData.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  '\u20B9 ${expenseData.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIconsMap[expenseData.expenseCategory]),
                    const SizedBox(width: 5),
                    Text(
                      expenseData.formattedDate,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
