import 'package:flutter/material.dart';

class NewTransactionPage extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransactionPage(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
              child: const Text('Add Transaction'),
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
