import 'package:be_healthy/Widgets/waterPage/customProgressBar.dart';
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
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
