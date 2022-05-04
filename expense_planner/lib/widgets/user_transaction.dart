import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 700, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Dress', amount: 600, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'New Shoes', amount: 700, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Dress', amount: 600, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'New Shoes', amount: 700, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Dress', amount: 600, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'New Shoes', amount: 700, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Dress', amount: 600, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'New Shoes', amount: 700, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Dress', amount: 600, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}