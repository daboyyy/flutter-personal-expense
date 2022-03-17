import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  final amountController = TextEditingController();
  final titleController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              TextButton(
                  child: Text('Add Transaction'),
                  onPressed: () {
                    addTx(titleController.text,
                        double.parse(amountController.text));
                  },
                  style: TextButton.styleFrom(primary: Colors.purple))
            ]),
        padding: EdgeInsets.all(10),
      ),
      elevation: 5,
    );
  }
}
