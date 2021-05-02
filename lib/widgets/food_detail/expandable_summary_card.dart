import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../custom_table_cell_item.dart';

class ExpandableSummaryCard extends StatelessWidget {
  String dateText;
  List foods;
  int totalCal;
  ExpandableSummaryCard({this.dateText, this.foods, this.totalCal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ExpansionTile(
          //childrenPadding: EdgeInsets.symmetric(vertical: 20),
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
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      totalCal.toString() + " kcal",
                      //sumOfSummaryCalories(calories).toString(),
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
            ListView.builder(
              shrinkWrap: true,
              //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              itemCount: foods.length,
              //scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(2)
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          CustomTableCellItem(
                            text: foods[index]["name"],
                            customTextStyle: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          CustomTableCellItem(
                            text: foods[index]["calorie"].toString() + " kcal",
                            customTextStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFA4A0C),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
