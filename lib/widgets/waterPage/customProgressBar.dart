import "package:flutter/material.dart";
import 'package:percent_indicator/percent_indicator.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    Key key,
    @required this.percentage,
  }) : super(key: key);

  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: CircularPercentIndicator(
          radius: 350.0,
          lineWidth: 20.0,
          animation: true,
          percent: percentage / 100,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                percentage.toString() + "%",
                style: TextStyle(
                  fontSize: 48.0,
                  //fontWeight: FontWeight.w600,
                  color: Color(0xFFFA4A0C),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "1500ml / 3000ml",
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.w600,
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
