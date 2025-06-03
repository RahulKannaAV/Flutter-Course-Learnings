// Expenses Widget
import 'package:flutter/material.dart';
import 'package:expense_tracker_s5/model/expense_model.dart';
import 'package:expense_tracker_s5/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker_s5/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _dummyData = [
    ExpenseModel(
      amount: 450,
      title: 'Complete Flutter guide',
      expenseDate: DateTime.now(),
      expenseCategory: Category.work,
    ),
    ExpenseModel(
      amount: 66,
      title: 'Snacks',
      expenseDate: DateTime.parse("2025-05-22"),
      expenseCategory: Category.food,
    ),
    ExpenseModel(
      amount: 150,
      title: 'Chicken',
      expenseDate: DateTime.parse("2025-05-24"),
      expenseCategory: Category.food,
    ),
  ];

  void _addNewExpense(ExpenseModel expenseData) {
    setState(() {
      _dummyData.add(expenseData);
    });
  }

  void _clearDismissedExpense(ExpenseModel dismissedExpense) {
    setState(() {
      _dummyData.remove(dismissedExpense);
    });
  }

  void _showModalBottomSheetOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addExpenseFn: _addNewExpense),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker App'),
        actions: [
          IconButton(
            onPressed: _showModalBottomSheetOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Chart section'),
          Expanded(
            child: ExpensesList(
              listData: _dummyData,
              dismissiveFn: _clearDismissedExpense,
            ),
          ),
        ],
      ),
    );
  }
}
