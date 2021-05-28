import 'package:be_healthy/Widgets/smokePage/customSmokePageInfoCard.dart';
import 'package:be_healthy/Widgets/smokePage/customSmokePageTopContainer.dart';
import 'package:flutter/material.dart';

class Smoke extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomSmokePageTopContainer(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 325,
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
      ),
    );
  }
}
