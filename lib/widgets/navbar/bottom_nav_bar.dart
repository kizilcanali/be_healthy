import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../state_management.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        print(context.read<Store>().buttomNavIndex);
        context.read<Store>().trackNavIndexState(index);
      },
      currentIndex: context.watch<Store>().buttomNavIndex,
      iconSize: 32,
      elevation: 0,
      showSelectedLabels: false,
      selectedItemColor: Color(0xFFFA4A0C),
      unselectedItemColor: Color(0xFFB1B1B3),
      items: [
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFF2F2F2),
          icon: Icon(
            Ionicons.md_home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFF2F2F2),
          icon: Icon(Ionicons.ios_water),
          label: 'Water',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFF2F2F2),
          icon: Icon(Ionicons.logo_no_smoking),
          label: 'Smoke',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFF2F2F2),
          icon: Icon(Ionicons.md_bookmark),
          label: 'Summary',
        ),
      ],
    );
  }
}
