import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final double totalByMonth;
  final Function showCalendar;
  final DateTime? selectDate;
  final Function() previousMonth;
  final Function() nextMonth;
  const Header(this.totalByMonth, this.showCalendar, this.selectDate, this.previousMonth, this.nextMonth);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  showCalendar(context);
                },
                child: Text(DateFormat("MMMM, y").format(selectDate!).toString(), style: const TextStyle(fontSize: 20,),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 40, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: previousMonth,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${totalByMonth.toStringAsFixed(0)}",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  const Text("SO'M")
                ],
              ),
               IconButton(
                  onPressed: nextMonth,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
