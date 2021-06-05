import 'package:be_healthy/Widgets/smokePage/customSmokePageInfoCard.dart';
import 'package:be_healthy/Widgets/smokePage/customSmokePageTopContainer.dart';
import 'package:be_healthy/state_management.dart';
import 'package:flutter/material.dart';
import 'package:be_healthy/Services/database_helper.dart';
import 'package:provider/provider.dart';

class Smoke extends StatelessWidget {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  final List returnedSmokeValues = [];

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
                  return CustomSmokePageInfoCard(
                    context.read<Store>().smokeProgressData[index]
                        ["appearing_text"],
                    context.read<Store>().smokeProgressData[index]
                        ["description"],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
