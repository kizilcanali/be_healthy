import 'package:be_healthy/Widgets/custom_table_cell_item.dart';
import 'package:be_healthy/Widgets/food_detail/expandable_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../state_management.dart';

class ConsumptionSummary extends StatefulWidget {
  @override
  _ConsumptionSummaryState createState() => _ConsumptionSummaryState();
}

class _ConsumptionSummaryState extends State<ConsumptionSummary> {
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    List sumFoods = context.read<Store>().summaryFoods;

    //print("sumfoods: $sumFoods");
    return ListView.builder(
      shrinkWrap: true,
      itemCount: sumFoods.length,
      itemBuilder: (BuildContext context, int index) {
        //Calculate total calorie of day.
        int sumOfSummaryCalories(List calories) {
          int sumCal = 0;
          if (calories.length != 0) {
            for (int i = 0; i < calories.length; i++) {
              sumCal += calories[i]["calorie"];
            }
          }
          return sumCal;
        }

        //Summary page cards.
        return ExpandableSummaryCard(
          dateText: sumFoods[index]["date"],
          foods: sumFoods[index]["foods"],
          totalCal: sumOfSummaryCalories(
            sumFoods[index]["foods"],
          ),
        );
      },
    );
  }
}
