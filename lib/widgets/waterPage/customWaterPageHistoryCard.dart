import 'package:flutter/material.dart';

class CustomWaterPageHistoryCard extends StatelessWidget {
  int completed = 0;
  int target = 0;
  String date;

  CustomWaterPageHistoryCard({this.completed, this.target, this.date});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: completed < target ? Color(0xFFFA4A0C) : Color(0xFF0CB3FA),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              Text(
                "${completed.toString()}ml / ${target.toString()}ml",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                date,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          left: 320,
          top: 27,
          child: Icon(
            completed < target ? Icons.close : Icons.check,
            size: 45,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
