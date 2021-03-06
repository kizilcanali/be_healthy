import 'package:be_healthy/Utilities/constants.dart';
import 'package:be_healthy/state_management.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              context.read<Store>().caloryTarget < totalCal
                  ? Icon(
                      Icons.thumb_down_off_alt,
                      size: 50,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.thumb_up_off_alt,
                      size: 50,
                      color: Colors.green,
                    ),
              SizedBox(
                width: 50,
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
                                style: kSummaryPageNameTextStyle,
                              ),
                              Text(foods[index]["calorie"].toString() + " kcal",
                                  style: kSummaryPageCaloryTextStyle),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Protein: ",
                      style: kSummaryPageNutritionTextStyle,
                    ),
                    Text(
                      sumOfNutritionValues[0][0].toString() + "g ",
                      style: kSummaryPageNutritionNumericTextStyle,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "K.hidrat: ",
                      style: kSummaryPageNutritionTextStyle,
                    ),
                    Text(
                      sumOfNutritionValues[0][1].toString() + "g ",
                      style: kSummaryPageNutritionNumericTextStyle,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Ya??: ",
                      style: kSummaryPageNutritionTextStyle,
                    ),
                    Text(
                      sumOfNutritionValues[0][2].toString() + "g ",
                      style: kSummaryPageNutritionNumericTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
