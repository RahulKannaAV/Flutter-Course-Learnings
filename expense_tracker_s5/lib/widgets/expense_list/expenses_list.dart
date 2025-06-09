import 'package:flutter/material.dart';
import 'package:expense_tracker_s5/model/expense_model.dart';
import 'package:expense_tracker_s5/widgets/expense_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.listData,
    required this.dismissiveFn,
  });

  final List<ExpenseModel> listData;
  final void Function(ExpenseModel expense) dismissiveFn;
  @override
  Widget build(context) {
    return ListView.builder(
      itemBuilder:
          (ctx, idx) => Dismissible(
            background: Container(color: Theme.of(context).colorScheme.onError),
            onDismissed: (direction) {
              dismissiveFn(listData[idx]);
            },
            key: ValueKey(ExpensesItem(listData[idx])),
            child: ExpensesItem(listData[idx]),
          ),
      itemCount: listData.length,
    );
  }
}
