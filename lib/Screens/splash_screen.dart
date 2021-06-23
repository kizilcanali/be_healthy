import 'dart:convert';
import 'package:be_healthy/Screens/home_body.dart';
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
  List summaryWater;
  List smokeProgressData;

  @override
  void initState() {
    super.initState();

    whenStarting();
    Future.delayed(
      Duration(seconds: 1),
      () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeBody(),
          ),
        );
      },
    );
  }

  Future<void> whenStarting() async {
    //Take current time.
    var nowDate = DateTime.now();
    String day = nowDate.day.toString() + " / " + nowDate.month.toString();

    smokeProgressData = await dbHelper.getSmokeProgressTable();
    context.read<Store>().newSmokeProgress(smokeProgressData);

    int caloryTarget = await dbHelper.getTargets("calory");
    int waterTarget = await dbHelper.getTargets("water");
    int smokeCount = await dbHelper.getTargets("smoke_count");
    int smokePrice = await dbHelper.getTargets("smoke_price");

    var isTargetsEmpty = await dbHelper.isTargetEmpty();
    if (isTargetsEmpty) {
      await dbHelper.initialTargetAssigner();
    }

    //GET Datas when starting
    mealsFromDB = await dbHelper.getRandomMealsByCategory();
    categoriesList = await dbHelper.getCategories();
    summaryFoods = await dbHelper.getSummaryTable();
    summaryWater = await dbHelper.getWaterTable();

    List tempWaterList = [];

    for (int i = 0; i < summaryWater.length; i++) {
      tempWaterList.add(
        {
          "date": summaryWater[i]["date"],
          "current_amount": summaryWater[i]["current_amount"],
          "target": summaryWater[i]["target"],
        },
      );
    }

    //print("calory target: $caloryTarget");
    if (tempWaterList.length == 0 ||
        tempWaterList[tempWaterList.length - 1]["date"] != day) {
      tempWaterList.add(
        {
          "date": day,
          "current_amount": 0,
          "target": waterTarget,
        },
      );
      dbHelper.insertWater(0, waterTarget);
    }

    context.read<Store>().newSummaryWater(tempWaterList);

    // GET TARGETS FROM DB
    context.read<Store>().newCaloryTarget(caloryTarget);
    context.read<Store>().newTarget(waterTarget);
    context.read<Store>().newSmokeCount(smokeCount);
    context.read<Store>().newSmokePrice(smokePrice);

    // Food part
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
    context.read<Store>().newSummaryFoods(tempSummaryList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
