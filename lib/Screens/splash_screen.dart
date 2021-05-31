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

  int smokeCount;
  int smokePrice;
  int waterTarget;
  int caloryTarget;

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
    //await dbHelper.removeAll();

    var isTargetsEmpty = await dbHelper.isTargetEmpty();
    if (isTargetsEmpty) {
      print("girildi");
      await dbHelper.initialTargetAssigner();
    }

    //GET Datas when starting
    mealsFromDB = await dbHelper.getRandomMealsByCategory();
    categoriesList = await dbHelper.getCategories();
    summaryFoods = await dbHelper.getSummaryTable();
    summaryWater = await dbHelper.getWaterTable();

    //Take current time.
    var nowDate = DateTime.now();
    String day = nowDate.day.toString() + " / " + nowDate.month.toString();

    List tempWaterList = [];
    print("temp water list: $tempWaterList");
    for (int i = 0; i < summaryWater.length; i++) {
      tempWaterList.add(
        {
          "date": summaryWater[i]["date"],
          "current_amount": summaryWater[i]["current_amount"],
          "target": summaryWater[i]["target"],
        },
      );
    }
    if (tempWaterList.length == 0 ||
        tempWaterList[tempWaterList.length - 1]["date"] != day) {
      print("Boşsa su ekleme if i ne girdim");
      tempWaterList.add(
        {
          "date": day,
          "current_amount": 0,
          "target": 0,
        },
      );
      dbHelper.insertWater(0, 0);
    }
    print("yeniden tempe bakalım eklemiş mi $tempWaterList");

    context.read<Store>().newSummaryWater(tempWaterList);

    // GET TARGETS FROM DB
    caloryTarget = await dbHelper.getTargets("calory");
    waterTarget = await dbHelper.getTargets("water");
    smokeCount = await dbHelper.getTargets("smoke_count");
    smokePrice = await dbHelper.getTargets("smoke_price");

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
