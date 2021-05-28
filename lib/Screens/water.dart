import 'package:be_healthy/Widgets/waterPage/customProgressBar.dart';
import 'package:be_healthy/Widgets/waterPage/customWaterAmountButtons.dart';
import 'package:be_healthy/Widgets/waterPage/customWaterPageHistoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Water extends StatefulWidget {
  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  int percentage = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomProgressBar(percentage: percentage),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomWaterButton(
                iconData: MaterialCommunityIcons.water_percent,
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
          SizedBox(height: 16),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: 5,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, int index) {
                return CustomWaterPageHistoryCard(
                  completed: 3000,
                  target: 3000,
                  date: "24/05/2021",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
