import 'package:be_healthy/routes.dart';
import 'package:be_healthy/state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int index = 0;
  final List<dynamic> meals = [];
  final List<dynamic> categories = [];
  final List<dynamic> summaryFoods = [];

  final List<dynamic> summaryWater = [];
  final int currentWater = 0;
  final int targetWater = 0;
  final int targetCalory = 0;
  final int smokeCount = 0;
  final int smokePrice = 0;
  final int differenceBetweenTime = 0;

  final List<dynamic> smokeProgressData = [];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<Store>(
          create: (_) => Store(
              index,
              meals,
              categories,
              summaryFoods,
              currentWater,
              targetWater,
              summaryWater,
              targetCalory,
              smokeCount,
              smokePrice,
              smokeProgressData,
              differenceBetweenTime),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
