import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String id) removeTransaction;
  const TransactionList({
    super.key,
    required this.transactions,
    required this.removeTransaction,
  });

  @override
  Widget build(BuildContext context) {
    final screen360 = MediaQuery.of(context).size.width > 360;

    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  "No Transactions added yet",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: constraints.maxHeight * .2,
                ),
                SizedBox(
                  height: constraints.maxHeight * .6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                transaction: transactions[index],
                screen360: screen360,
                removeTransaction: removeTransaction,
              );
            },
            itemCount: transactions.length,
          );
  }
}
