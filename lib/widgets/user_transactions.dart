import 'package:flutter/material.dart';

// import './transaction_form.dart';
import './transaction_form.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      amount: 69.99,
      date: DateTime.now(),
      title: 'New Shoes',
    ),
    Transaction(
      id: 't2',
      amount: 45,
      date: DateTime.now(),
      title: 'Weekly Groceries',
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final transaction = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionForm(addTransaction: _addNewTransaction),
      TransactionList(
        transactions: _userTransactions,
      ),
    ]);
  }
}
