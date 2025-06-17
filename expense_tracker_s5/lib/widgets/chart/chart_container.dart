import 'package:flutter/material.dart';

import 'package:expense_tracker_s5/widgets/chart/chart_bar.dart';
import 'package:expense_tracker_s5/model/expense_model.dart';

class ChartContainer extends StatelessWidget {
  ChartContainer({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  List<ExpenseStats> get buckets {
    return [
      ExpenseStats.forCategory(expenses, Category.food),
      ExpenseStats.forCategory(expenses, Category.leisure),
      ExpenseStats.forCategory(expenses, Category.travel),
      ExpenseStats.forCategory(expenses, Category.work),
    ];
  }

  List<IconData> categoryIcons = [
    Icons.work,
    Icons.flight,
    Icons.tv,
    Icons.food_bank,
  ];

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpensesOfOneCategory > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpensesOfOneCategory;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill:
                        bucket.totalExpensesOfOneCategory == 0
                            ? 0
                            : bucket.totalExpensesOfOneCategory /
                                maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children:
                buckets
                    .map(
                      (bucket) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            categoryIcons[0],
                            color:
                                isDarkMode
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(
                                      context,
                                    ).colorScheme.primary.withOpacity(0.7),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
