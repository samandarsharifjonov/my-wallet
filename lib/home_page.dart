import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:my_wallet/models/expense.dart';
import 'package:my_wallet/widgets/about.dart';
import 'package:my_wallet/widgets/add_exspense.dart';
import 'package:my_wallet/widgets/body.dart';
import 'package:my_wallet/widgets/header.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Expenses expenses = Expenses();
  DateTime? selectDate = DateTime.now();
  About about = About();





  void showCalendar(BuildContext buildContext) {
    showMonthPicker(
      context: buildContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectDate = value;
        });
      }
    });
  }

  void previousMonth() {
    if (selectDate!.year == 2024 && selectDate!.month == 1) {
      return;
    }
    setState(() {
      selectDate =
          DateTime(selectDate!.year, selectDate!.month - 1, selectDate!.day);
    });
  }

  void nextMonth() async {
    if (selectDate!.year == DateTime.now().year &&
        selectDate!.month == DateTime.now().month) {
      return;
    }
    setState(() {
      selectDate =
          DateTime(selectDate!.year, selectDate!.month + 1, selectDate!.day);
    });
  }

  void showAddExpenseWindow(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return AddExpense(addNewExpense);
      },
    );
  }

  void addNewExpense(String title, double amount, DateTime date) {
    setState(() {
      expenses.addNewExpense(title, amount, date);
    });
  }

  void deleteExpense(String id) {
    setState(() {
      expenses.delete(id);
    });
  }

  void _showAboutDialog(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Haqida"),
        content: Text(about.about),
        actions: [
          ElevatedButton(onPressed: Navigator.of(context).pop, child: Text("OK"))
        ],
      );

    });
  }



  @override
  Widget build(BuildContext context) {

    final totalByMonth = expenses.totalExpenseByMonth(selectDate!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Mening hamyonim",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
                onPressed: () {
                  _showAboutDialog(context);
                },
                icon: Image.asset(
                  "assets/img/about.png",
                  height: 25,
                  width: 25,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(totalByMonth, showCalendar, selectDate, previousMonth,
                nextMonth),
            Body(
                expenses.itemByMonth(selectDate!), totalByMonth, deleteExpense),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddExpenseWindow(context);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
