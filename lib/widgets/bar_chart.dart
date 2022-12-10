import 'package:budget_app_ui/widgets/bar_item.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart({super.key, required this.expenses});
  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (var price in expenses) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 30.0,
                onPressed: () {},
              ),
              const Flexible(
                child: Text(
                  'Nov 10, 2019 - Nov 16, 2019',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              BarItem(
                label: 'Su',
                amountSpent: expenses[0],
                mostExpensive: mostExpensive,
              ),
              BarItem(
                label: 'Mo',
                amountSpent: expenses[1],
                mostExpensive: mostExpensive,
              ),
              BarItem(
                label: 'Tu',
                amountSpent: expenses[2],
                mostExpensive: mostExpensive,
              ),
              BarItem(
                label: 'We',
                amountSpent: expenses[3],
                mostExpensive: mostExpensive,
              ),
              BarItem(
                label: 'Th',
                amountSpent: expenses[4],
                mostExpensive: mostExpensive,
              ),
              BarItem(
                label: 'Fr',
                amountSpent: expenses[5],
                mostExpensive: mostExpensive,
              ),
              BarItem(
                label: 'Sa',
                amountSpent: expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
