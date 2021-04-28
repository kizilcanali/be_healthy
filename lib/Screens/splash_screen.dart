import 'package:be_healthy/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:be_healthy/Services/database_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  List mealsFromDB = [];
  List categoriesList;
  @override
  void initState() {
    super.initState();

    deneme();
    Future.delayed(Duration(seconds: 1), () async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    mealsFromDB: mealsFromDB,
                    categories: categoriesList,
                  )));
    });
  }

  Future<void> deneme() async {
    mealsFromDB = await dbHelper.getRandomMealsByCategory();
    categoriesList = await dbHelper.getCategories();
    print(categoriesList[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
