import 'package:be_healthy/Screens/consumption_summary.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConsumptionSummary(),
    );
  }
}
