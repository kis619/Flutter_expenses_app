import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double amount) addTransaction;

  const TransactionForm({super.key, required this.addTransaction});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    widget.addTransaction(
      titleController.text.isEmpty ? 'Default' : titleController.text,
      double.tryParse(amountController.text) ?? 0,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text('Add transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
