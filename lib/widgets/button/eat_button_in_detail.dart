import 'dart:convert';
import 'package:be_healthy/Services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state_management.dart';

class InDetailEatButton extends StatelessWidget {
  final dynamic meal;

  const InDetailEatButton({this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 110, right: 50, left: 50),
      child: ElevatedButton(
        onPressed: () async {
          DatabaseHelper dbHelper = DatabaseHelper.instance;
          var nowDate = DateTime.now();
          String day =
              nowDate.day.toString() + " / " + nowDate.month.toString();
          context.read<Store>().addFoodsToSummary(day, meal);

          var a = jsonEncode(
            context
                    .read<Store>()
                    .summaryFoods[context.read<Store>().summaryFoods.length - 1]
                ["foods"],
          );

          //a = a.substring(1, a.length);
          print("Kaydettiğimiz $a");
          await dbHelper.insertSummary(
            day,
            a,
          );
        },
        child: Text(
          'Bugün Tükettim',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 63),
          primary: Color(0xFFFA4A0C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
