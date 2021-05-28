import "package:flutter/material.dart";
import 'package:percent_indicator/percent_indicator.dart';

import '../../state_management.dart';
import 'package:provider/provider.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    Key key,
    @required this.percentage,
  }) : super(key: key);

  final int percentage;

  @override
  Widget build(BuildContext context) {
    double calculatePercent() {
      double percentage = 0;
      if (context.read<Store>().currentAmount != 0) {
        percentage = (context.read<Store>().currentAmount * 100) /
            context.read<Store>().target;
      }
      return percentage;
    }

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: CircularPercentIndicator(
          radius: 250.0,
          lineWidth: 20.0,
          animation: true,
          percent: calculatePercent() / 100,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                calculatePercent().toString() + "%",
                style: TextStyle(
                  fontSize: 48.0,
                  color: Color(0xFFFA4A0C),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "${context.read<Store>().currentAmount} / ${context.read<Store>().target}",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFFFA4A0C),
                ),
              ),
            ],
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Color(0xFF0CB3FA),
          backgroundColor: Color(0x80FA4A0C),
        ),
      ),
    );
  }
}
