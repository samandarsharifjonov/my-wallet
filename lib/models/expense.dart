import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final DateTime dateTime;
  final double amount;
  final IconData? iconData;

  Expense(
      {required this.id,
      required this.title,
      required this.dateTime,
      required this.amount,
      this.iconData = Icons.wallet_outlined});
}

class Expenses {
  List<Expense> _items = [];
  List<Expense> get items => _items;

  List<Expense> itemByMonth(DateTime date) {
    return _items.where((element) =>
        element.dateTime.month == date.month &&
        element.dateTime.year == date.year).toList();
  }

  double totalExpenseByMonth(DateTime date){
    final expenseByMonth = itemByMonth(date);
    return expenseByMonth.fold(0,
            (previousValue, element){
             return previousValue + element.amount;
            });
  }

  void addNewExpense(String title, double amount, DateTime date) {
    _items.add(Expense(
        id: "id${_items.length + 1}",
        title: title,
        amount: amount,
        dateTime: date));
  }

  void delete (String id){
    _items.removeWhere((element) => element.id == id);
  }

}
