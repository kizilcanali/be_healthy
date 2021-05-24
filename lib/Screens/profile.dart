import 'package:be_healthy/Widgets/profilePage/customProfilePageInfoCard.dart';
import 'package:be_healthy/Widgets/profilePage/customProfileParameterCard.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomProfilePageInfoCard(),
            SizedBox(
              height: 15,
            ),
            CustomProfileParameterEditCard(),
            SizedBox(
              height: 15,
            ),
            CustomProfileParameterEditCard(),
            SizedBox(
              height: 15,
            ),
            CustomProfileParameterEditCard(),
            SizedBox(
              height: 15,
            ),
            CustomProfileParameterEditCard(),
          ],
        ),
      ),
    );
  }
}
