import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTOtal;

  const ChartBar(
      {super.key,
      required this.spendingAmount,
      required this.spendingPctOfTOtal,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * .15,
              child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            SizedBox(
              height: constraints.maxHeight * .6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  )),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTOtal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            SizedBox(
              height: constraints.maxHeight * .15,
              child: FittedBox(child: Text(label)),
            ),
          ],
        );
      },
    );
  }
}
