import 'package:flutter/material.dart';

import '../../state_management.dart';
import 'package:provider/provider.dart';

class CustomWaterButton extends StatefulWidget {
  IconData iconData;
  String waterAmount;
  CustomWaterButton({this.iconData, this.waterAmount});

  @override
  _CustomWaterButtonState createState() => _CustomWaterButtonState();
}

class _CustomWaterButtonState extends State<CustomWaterButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        //print(widget.waterAmount);
        context.read<Store>().addWaterToSummary(int.parse(widget.waterAmount));
      },
      fillColor: Color(0xFFFA4A0C),
      child: Column(
        children: [
          Icon(
            widget.iconData,
            size: 40,
            color: Colors.white,
          ),
          Text(
            widget.waterAmount + "ml",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(15),
      shape: CircleBorder(),
    );
  }
}
