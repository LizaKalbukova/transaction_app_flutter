import 'package:flutter/material.dart';

import 'package:transactions/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(
      this.transactions); //конструктор щоб з батьківського віджета передати дані в дочірній

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text('No transactions added yet !',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/sleeping.png'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.16),
                            BlendMode.modulate,
                          ))),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.grey),
                        ),
                        margin: EdgeInsets.all(18),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}', //transactions[index] тепер замість txt
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(DateFormat('dd/MM/yyyy')
                              .format(transactions[index].date))
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
