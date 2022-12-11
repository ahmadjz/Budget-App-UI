import 'package:budget_app_ui/data/data.dart';
import 'package:budget_app_ui/models/category_model.dart';
import 'package:budget_app_ui/widgets/bar_chart.dart';
import 'package:budget_app_ui/widgets/category_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          forceElevated: true,
          floating: true,
          // pinned: true,
          expandedHeight: 100.0,
          leading: IconButton(
            icon: const Icon(Icons.settings),
            iconSize: 30.0,
            onPressed: () {},
          ),
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Simple Budget'),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              iconSize: 30.0,
              onPressed: () {},
            ),
          ],
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: BarChart(expenses: weeklySpending),
              );
            } else {
              final Category category = categories[index - 1];
              double totalAmountSpent = 0;
              for (var expense in category.expenses) {
                totalAmountSpent += expense.cost;
              }
              return CategoryItem(
                category: category,
                totalAmountSpent: totalAmountSpent,
              );
            }
          },
          childCount: 1 + categories.length,
        ))
      ]),
    );
  }
}
