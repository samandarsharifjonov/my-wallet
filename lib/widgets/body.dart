import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'budget.dart';
import 'expense_list.dart';
class Body extends StatelessWidget {
  final List<Expense> expenses;
  final double totalByMonth;
  final Function deleteExpense;
  Body(this.expenses, this.totalByMonth, this.deleteExpense);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Budget(totalByMonth),
        ExpenseList(expenses, deleteExpense),
      ],
    );
  }
}
