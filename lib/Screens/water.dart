import 'package:be_healthy/Widgets/waterPage/customProgressBar.dart';
import 'package:be_healthy/Widgets/waterPage/customWaterAmountButtons.dart';
import 'package:be_healthy/Widgets/waterPage/customWaterPageHistoryCard.dart';
import 'package:flutter/material.dart';

class Water extends StatefulWidget {
  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  int percentage = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomProgressBar(percentage: percentage),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomWaterButton(
                  iconData: Icons.access_alarm_outlined,
                  waterAmount: "100ml",
                ),
                CustomWaterButton(
                  iconData: Icons.golf_course_sharp,
                  waterAmount: "200ml",
                ),
                CustomWaterButton(
                  iconData: Icons.account_tree_rounded,
                  waterAmount: "500ml",
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
