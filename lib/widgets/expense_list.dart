import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'expense_items.dart';

class ExpenseList extends StatefulWidget {

  final List<Expense> expenses;
  final Function deleteExpense;
  ExpenseList(this.expenses, this.deleteExpense);

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: widget.expenses.length > 0
            ? ListView.builder(
                padding: EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  return ExpenseItem(
                    widget.expenses[index].id,
                    widget.expenses[index].title,
                    widget.expenses[index].dateTime,
                    widget.expenses[index].amount,
                    ValueKey(widget.expenses[index].id),
                    widget.deleteExpense);},
                itemCount: widget.expenses.length,
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    const Text(
                      "Xarajatlar mavjud emas!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    Center(
                        child: Image.asset("assets/img/empty.png",
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    )),
                  ],
                ),
              ),
      ),
    );
  }
}
