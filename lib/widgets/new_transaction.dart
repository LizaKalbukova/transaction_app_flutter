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

  void submitData() {
    final enteredTitle = textControler.text;
    final enteredAmount = double.parse(amountControler.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: textControler,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountControler,
            keyboardType: TextInputType.number,
            onSubmitted: (_) =>
                submitData(), // _ значить що у мене може бути імпут, але мені всерівно
          ),
          TextButton(
              onPressed: submitData, //????????
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),
    );
  }
}
