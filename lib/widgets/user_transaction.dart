import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_list.dart';
import './new_transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _list = [
    Transaction(
      amount: 69.99,
      date: DateTime.now(),
      id: 't1',
      title: 'buy new shoe',
    ), //t1
    Transaction(
      amount: 30.22,
      date: DateTime.now(),
      id: 't2',
      title: 'have a dinner',
    ),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: txTitle);
    setState(() {
      _list.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_list),
      ],
    );
  }
}
