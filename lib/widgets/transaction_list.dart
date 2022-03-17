import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 493,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '\$ ${transactions[index].amount.toString()}',
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(color: Colors.grey))
                  ],
                )
              ],
            ));
          },
          itemCount: transactions.length,
        ));
  }
}
