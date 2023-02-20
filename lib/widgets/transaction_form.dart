import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final void Function(String title, double amount) addTransaction;

  TransactionForm({super.key, required this.addTransaction});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
                onPressed: () {
                  addTransaction(
                    titleController.text,
                    double.tryParse(amountController.text) ?? 0,
                  );
                },
                child: const Text('Add transaction')),
          ],
        ),
      ),
    );
  }
}
