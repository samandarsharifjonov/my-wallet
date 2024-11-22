import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class EditMonthlyBudget extends StatefulWidget {
  final Function changeBudget;
  const EditMonthlyBudget(this.changeBudget);



  @override
  State<EditMonthlyBudget> createState() => _EditMonthlyBudgetState();
}

class _EditMonthlyBudgetState extends State<EditMonthlyBudget> {
  final _budgetAmountController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            TextField(
              controller: _budgetAmountController,
              decoration: const InputDecoration(
                labelText: "Oylik budgetni kiritin!",

              ),
              keyboardType: TextInputType.number,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 TextButton(onPressed: (){
                   Navigator.of(context).pop();
                 }, child: const Text("Bekor qilsh")),
                 ElevatedButton(onPressed: (){
                   if(_budgetAmountController.text.isEmpty){
                     return;
                   }
                   final amount = double.parse(_budgetAmountController.text);
                   if(amount > 0){
                     widget.changeBudget(amount);
                     Navigator.of(context).pop();
                   }
                      }, child: const Text("O'zgartirish")),
               ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
