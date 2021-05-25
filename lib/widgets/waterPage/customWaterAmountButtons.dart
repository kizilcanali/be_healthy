import 'package:flutter/material.dart';

class CustomWaterButton extends StatelessWidget {
  IconData iconData;
  String waterAmount;
  CustomWaterButton({this.iconData, this.waterAmount});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      fillColor: Color(0xFFFA4A0C),
      child: Column(
        children: [
          Icon(
            iconData,
            size: 40,
            color: Colors.white,
          ),
          Text(
            waterAmount,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
      padding: EdgeInsets.all(15),
      shape: CircleBorder(),
    );
  }
}
