import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddExpense extends StatefulWidget {
  final Function addNewExpense;
  AddExpense(this.addNewExpense);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime? selectedDate;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  void selectedCalendar(BuildContext buildContext) {
    showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(2024),
            lastDate: DateTime.now(),
            initialEntryMode: DatePickerEntryMode.calendar,
            helpText: "Xarajat kunini tanlang!",
            cancelText: "Bekor qilish",
            confirmText: "Kiritish")
        .then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }
  void closedModalWindow(BuildContext buildContext) {
    setState(() {
      Navigator.of(context).pop();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).viewInsets.bottom + 200,
      ),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "xarajat nomi"),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "xarajat miqdori",
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectedDate == null
                        ? Text("Xarajat kuni tanlanmadi!")
                        : Text(DateFormat("MMMM d, y").format(selectedDate!)),
                    TextButton(
                        onPressed: () {
                          if (selectedDate.toString().isEmpty) {
                            return;
                          }
                          selectedCalendar(context);
                        },
                        child: const Text("KUNNI TANLASH")),
                  ],
                ),
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        closedModalWindow(context);
                      },
                      child: const Text("Bekor qilish")),
                  ElevatedButton(
                      onPressed: () {
                        if (_titleController.text.isEmpty ||
                            _amountController.text.isEmpty ||
                            selectedDate.toString().isEmpty) {
                          return;
                        }
        
                        var title = _titleController.text;
                        var amount = double.parse(_amountController.text);
        
                        if(amount <= 0){
                          return;
                        }
        
                       widget.addNewExpense(title, amount, selectedDate);
                        closedModalWindow(context);
                      },
                      child: const Text("KIRITISH"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
