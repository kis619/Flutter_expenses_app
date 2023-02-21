import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> weekTransactions;

  const Chart({super.key, required this.weekTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < weekTransactions.length; i++) {
        if (weekTransactions[i].date.day == weekDay.day &&
            weekTransactions[i].date.month == weekDay.month &&
            weekTransactions[i].date.year == weekDay.year) {
          totalSum += weekTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
