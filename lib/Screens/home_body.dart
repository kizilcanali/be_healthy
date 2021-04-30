import 'package:be_healthy/Screens/consumption_summary.dart';
import 'package:be_healthy/Screens/smoke.dart';
import 'package:be_healthy/Screens/water.dart';
import 'package:be_healthy/Widgets/button/home_custom_icon_button.dart';
import 'package:be_healthy/widgets/navbar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_management.dart';
import 'home.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Widget> views = [Home(), Water(), Smoke(), ConsumptionSummary()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [custom_icon_button_home()],
      ),
      body: views[context.watch<Store>().buttomNavIndex],
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
