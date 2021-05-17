import 'dart:convert';
import 'package:be_healthy/Screens/login.dart';
import 'package:be_healthy/state_management.dart';
import 'package:flutter/material.dart';
import 'package:be_healthy/Services/database_helper.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  List mealsFromDB = [];
  List categoriesList;
  List summaryFoods;

  @override
  void initState() {
    super.initState();

    whenStarting();
    Future.delayed(Duration(seconds: 1), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  Future<void> whenStarting() async {
    //await dbHelper.removeAll();

    mealsFromDB = await dbHelper.getRandomMealsByCategory();
    categoriesList = await dbHelper.getCategories();
    //await dbHelper.insertSummary("30 Nisan", food);
    summaryFoods = await dbHelper.getSummaryTable();

    //print("ilk food: $a");
    //print("sum from db $summaryFoods");
    context.read<Store>().newMeals(mealsFromDB);
    context.read<Store>().newCategories(categoriesList);

    List tempSummaryList = [];
    for (int i = 0; i < summaryFoods.length; i++) {
      tempSummaryList.add(
        {
          "date": summaryFoods[i]["date"],
          "foods": jsonDecode(
            summaryFoods[i]["foods"],
          )
        },
      );
    }
    //print("summary from db: $summaryFoods");
    //print("temp sum list: $tempSummaryList");

    context.read<Store>().newSummaryFoods(tempSummaryList);

    //print(tempSummaryList);

    /*String food = """{
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
    }""";*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
