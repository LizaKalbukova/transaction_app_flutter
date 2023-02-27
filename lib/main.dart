import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transactions/widgets/new_transaction.dart';
import 'package:transactions/widgets/transaction_list.dart';
import 'package:transactions/widgets/user_transaction.dart';

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
  final textControler = TextEditingController(); /////////////
  final amountControler = TextEditingController(); ///////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('CHART!'),
                elevation: 5,
                color: Colors.green,
              ),
            ),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
