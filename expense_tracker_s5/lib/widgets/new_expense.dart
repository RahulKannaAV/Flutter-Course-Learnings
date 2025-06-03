import 'package:flutter/material.dart';
import 'package:expense_tracker_s5/model/expense_model.dart';
import 'package:expense_tracker_s5/widgets/expenses.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.addExpenseFn});

  void Function(ExpenseModel) addExpenseFn;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _pickedDate;
  Category _chosenCategory = Category.leisure;

  void _saveExpense() {
    final typedAmount = double.tryParse(_amountController.text);
    final isInvalidAmount = typedAmount == null || typedAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        _pickedDate == null ||
        isInvalidAmount) {
      // Error message
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text(
                'Make sure that entered title, amount, date is valid',
              ),
              actions: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('OK'),
                ),
              ],
            ),
      );

      return;
    }

    // Otherwise, save the data as new expense
    final ExpenseModel newExpenseData = ExpenseModel(
      amount: typedAmount,
      title: _titleController.text,
      expenseDate: _pickedDate!,
      expenseCategory: _chosenCategory,
    );

    widget.addExpenseFn(newExpenseData);
    Navigator.pop(context);
  }

  void _showDatePicker() async {
    final todayDate = DateTime.now();
    final firstDate = DateTime(
      todayDate.year - 1,
      todayDate.month,
      todayDate.day,
    );
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: todayDate,
    );

    setState(() {
      _pickedDate = selectedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 50, 18, 18),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text('Expense Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Expense Amount'),
                    prefixText: '\u20B9 ',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _pickedDate == null
                          ? 'No date chosen'
                          : formatter.format(_pickedDate!),
                    ),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                value: _chosenCategory,
                items:
                    Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _chosenCategory = value;
                  });
                },
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(onPressed: _saveExpense, child: Text('Save Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
