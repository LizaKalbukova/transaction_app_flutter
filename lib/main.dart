import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transactions/widgets/new_transaction.dart';
import 'package:transactions/widgets/transaction_list.dart';
import 'widgets/chart.dart';

import '../models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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

  void _startTextIput(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions App'),
        actions: [
          IconButton(
            onPressed: () => _startTextIput(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startTextIput(context),
      ),
    );
  }
}
