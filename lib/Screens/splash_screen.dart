import 'dart:convert';

import 'package:be_healthy/state_management.dart';
import 'package:flutter/material.dart';
import 'package:be_healthy/Services/database_helper.dart';
import 'package:provider/provider.dart';
import 'home_body.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  List mealsFromDB = [];
  List categoriesList;
  List summaryValues;
  @override
  void initState() {
    super.initState();

    deneme();
    Future.delayed(Duration(seconds: 1), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeBody()));
    });
  }

  Future<void> deneme() async {
    String food = """{
    "foods": [
        {
            "name" : "Mantı",
                "calorie": 1500,
                "protein": 10,
                "carbohydrate": 12,
                "fat": 10
        },
        {
            "name" : "Kuzu Çevirme",
                "calorie": 1000,
                "protein": 12,
                "carbohydrate": 24,
                "fat": 35
        }
    ]
}""";

    mealsFromDB = await dbHelper.getRandomMealsByCategory();
    categoriesList = await dbHelper.getCategories();
    //await dbHelper.insertSummary("30 Nisan", food);
    List summaryFoods = await dbHelper.getSummaryTable();
    //print(summaryFoods[0]["foods"]);

    context.read<Store>().newMeals(mealsFromDB);
    context.read<Store>().newCategories(categoriesList);
    Map<String, dynamic> summaryMap = jsonDecode(summaryFoods[1]["foods"]);
    print(summaryMap["foods"][1]["name"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
