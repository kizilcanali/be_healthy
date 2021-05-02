import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../custom_table_cell_item.dart';

class ExpandableSummaryCard extends StatelessWidget {
  final String dateText;
  final List foods;
  final int totalCal;
  final List sumOfNutritionValues;
  ExpandableSummaryCard(
      {this.dateText, this.foods, this.totalCal, this.sumOfNutritionValues});

  @override
  Widget build(BuildContext context) {
    //print(sumOfNutritionValues);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ExpansionTile(
          //childrenPadding: EdgeInsets.symmetric(vertical: 10),
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          title: Row(
            children: [
              Lottie.asset(
                'assets/images/okayicon.json',
                width: 100,
                height: 100,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateText,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      totalCal.toString() + " kcal",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFA4A0C)),
                    )
                  ],
                ),
              ),
            ],
          ),
          children: [
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: foods.length,
                  //scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                foods[index]["name"],
                              ),
                              Text(
                                foods[index]["calorie"].toString() + " kcal",
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(children: [
                  Text("P: ${sumOfNutritionValues[0][0]} g"),
                  Text("C: ${sumOfNutritionValues[0][1]} g"),
                  Text("F: ${sumOfNutritionValues[0][2]} g"),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
