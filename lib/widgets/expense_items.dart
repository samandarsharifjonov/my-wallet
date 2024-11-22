import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ExpenseItem extends StatelessWidget {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final Key key;
  final Function deleteExpense;
  const ExpenseItem(this.id, this.title, this.date, this.amount, this.key, this.deleteExpense) : super(key: key);


  @override
  Widget build(BuildContext context) {
    

    return Dismissible(
      key: key,
      onDismissed: (direction) {
        deleteExpense(id);
      },
      direction: DismissDirection.endToStart,
      background: const Card(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:  EdgeInsets.only(right: 15),
              child: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      child: Card(
        elevation: 15,
        child: ListTile(
          leading: Image.asset("assets/img/cost.png"),
          title: Text(title),
          subtitle: Text(DateFormat("d-MMMM, y").format(date)),
          trailing: Text("${amount} so'm"),
        ),
      ),
    );
  }
}
