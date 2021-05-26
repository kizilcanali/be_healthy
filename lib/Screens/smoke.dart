import 'package:be_healthy/Widgets/smokePage/customSmokePageInfoCard.dart';
import 'package:be_healthy/Widgets/smokePage/customSmokePageTopContainer.dart';
import 'package:flutter/material.dart';

class Smoke extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomSmokePageTopContainer(),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 265,
            child: ListView.builder(
              itemCount: 5,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, int index) {
                return customSmokePageInfoCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
