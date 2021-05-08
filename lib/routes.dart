import 'package:be_healthy/Screens/consumption_summary.dart';
import 'package:be_healthy/Screens/home_body.dart';
import 'package:be_healthy/Screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import 'Screens/home.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => SplashScreen(),
  '/home': (context) => HomeBody(),
  '/consumption_summary': (context) => ConsumptionSummary(),
};
