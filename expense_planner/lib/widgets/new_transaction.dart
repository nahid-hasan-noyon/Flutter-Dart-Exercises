import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptive_button.dart';

class NewTransaction extends StatefulWidget {
// * taking input 1st method
  final Function addTx;

  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
////  String titleInput = '', amountInput = '';
// * taking input 2nd method
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool isDatePicked = false;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isNotEmpty && enteredAmount > 0 && isDatePicked) {
      widget.addTx(enteredTitle, enteredAmount, _selectedDate);
      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          isDatePicked = false;
          return;
        } else {
          setState(() {
            _selectedDate = pickedDate;
            isDatePicked = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // * Enter Title
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                textInputAction: TextInputAction.next,
              ),
              // * Enter Amount
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                //onSubmitted: (inputData) => _submitData(),
              ),
              const SizedBox(
                height: 10,
              ),
              // * Date picker
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      isDatePicked == false
                          ? "No Date Chosen!!!"
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  AdaptiveButton('Choose Date', _presentDatePicker),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.white,
                ),
                onPressed: _submitData,
                child: const Text('Add Transaction'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
