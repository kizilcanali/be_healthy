import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../state_management.dart';
import 'package:provider/provider.dart';

class CustomProgressBar extends StatefulWidget {
  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    int calculatePercent() {
      int percentage = 0;
      if (context.read<Store>().currentAmount != 0) {
        percentage = ((context.read<Store>().currentAmount * 100) ~/
                context.read<Store>().target)
            .toInt();
      }

      return percentage;
    }

    double calculateProgressing(int percent) {
      if (percent / 100 > 1) {
        return 1;
      } else {
        return percent / 100;
      }
    }

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: CircularPercentIndicator(
          radius: 250.0,
          lineWidth: 20.0,
          animation: false,
          percent: calculateProgressing(calculatePercent()),
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${calculatePercent()}%",
                style: TextStyle(
                  fontSize: 48.0,
                  color: Color(0xFFFA4A0C),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "${context.watch<Store>().currentAmount} / ${context.read<Store>().target}",
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
