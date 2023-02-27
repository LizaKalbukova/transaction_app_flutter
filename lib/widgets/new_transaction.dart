import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transactions/widgets/new_transaction.dart';
import 'package:transactions/widgets/transaction_list.dart';
import 'package:transactions/widgets/user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final textControler = TextEditingController();
  final amountControler = TextEditingController();

  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: textControler,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountControler,
          ),
          TextButton(
              onPressed: () {
                addTx(
                  textControler.text,
                  double.parse(amountControler.text),
                );
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),
    );
  }
}
