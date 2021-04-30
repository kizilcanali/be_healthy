import 'package:be_healthy/routes.dart';
import 'package:be_healthy/state_management.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int index = 0;
  final List<dynamic> meals = [];
  final List<dynamic> categories = [];
  final List<dynamic> summaryFoods = [];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<Store>(
          create: (_) => Store(index, meals, categories, summaryFoods),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
