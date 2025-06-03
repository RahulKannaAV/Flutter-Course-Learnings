import 'package:flutter/material.dart';
import 'package:expense_tracker_s5/model/expense_model.dart';
import 'package:expense_tracker_s5/widgets/expense_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.listData});

  final List<ExpenseModel> listData;
  @override
  Widget build(context) {
    return ListView.builder(
      itemBuilder: (ctx, idx) => ExpensesItem(listData[idx]),
      itemCount: listData.length,
    );
  }
}
