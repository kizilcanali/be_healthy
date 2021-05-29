import 'package:flutter/material.dart';

class CustomTableCellItem extends StatelessWidget {
  String text;
  TextStyle customTextStyle;
  CustomTableCellItem({this.text, this.customTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: customTextStyle,
      ),
    );
  }
}
