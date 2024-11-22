import 'package:flutter/material.dart';
import 'package:my_wallet/widgets/edit_monthly_budget.dart';
import 'package:my_wallet/widgets/progress_bar.dart';
import 'package:intl/intl.dart';
class Budget extends StatefulWidget {
  final totalByMonth;
  Budget(this.totalByMonth);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
    double budgetLimit = 1000000;



  @override
  Widget build(BuildContext context) {


    void changeBudget(double amount){
      setState(() {
        budgetLimit = amount;
      });
    }

    void showMonthlyBudget(BuildContext buildContext){
      showModalBottomSheet(context: context,
          isDismissible: false,
          builder: (context) {
            return EditMonthlyBudget(changeBudget);
          },);
    }

    var  totalLimitPercentage = 100 * widget.totalByMonth / budgetLimit;
    totalLimitPercentage = totalLimitPercentage > 100 ? 100 : totalLimitPercentage;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 572,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(239, 240, 250, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Text("Oylik Budget"),
                  TextButton.icon(onPressed: () {
                    changeBudget;
                    showMonthlyBudget(context);
                  }, icon: const Icon(Icons.wallet), label: Text("${budgetLimit.toStringAsFixed(0)} so'm")),
                ],
              ),
              Text("${totalLimitPercentage.toStringAsFixed(0)} %"),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(212, 219, 239, 1),
              ),
              child: FractionallySizedBox(
                heightFactor: 2,
                widthFactor: totalLimitPercentage / 100,
                child: ProgressBar(),
              ),
            ),
          ),

        ],
      ),
    );
  }
}