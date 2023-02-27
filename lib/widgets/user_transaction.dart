import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Phone',
      amount: 800.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Shoes',
      amount: 45.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txamount) {
    // від користувача нам потрібні два вида данних title and amount
    final newTx = Transaction(
      title: txTitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now()
          .toString(), // типу унікальне id, замість нього буде дата, яка автоматично генерується в данному випадку
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
