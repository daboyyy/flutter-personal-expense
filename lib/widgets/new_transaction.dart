import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmout = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmout <= 0) return;

    widget.addTx(enteredTitle, enteredAmout);
    Navigator.of(context).pop();
  }

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
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              TextButton(
                  child: Text('Add Transaction'),
                  onPressed: submitData,
                  style: TextButton.styleFrom(primary: Colors.purple))
            ]),
        padding: EdgeInsets.all(10),
      ),
      elevation: 5,
    );
  }
}
