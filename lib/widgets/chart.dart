import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/chart_bar.dart';
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
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0,
        (previousValue, element) =>
            previousValue += (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                spendingAmount: data['amount'] as double,
                spendingPctOfTOtal: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
                label: data['day'] as String,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
