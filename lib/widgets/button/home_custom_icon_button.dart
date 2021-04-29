import 'package:flutter/material.dart';

class custom_icon_button_home extends StatelessWidget {
  const custom_icon_button_home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.person,
        color: Colors.grey,
        size: 30,
      ),
      onPressed: () {
        // will go to profile page
      },
    );
  }
}
