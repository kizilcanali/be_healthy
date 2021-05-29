import 'package:be_healthy/Widgets/profilePage/customProfilePageInfoCard.dart';
import 'package:be_healthy/Widgets/profilePage/customProfileParameterCard.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  TextEditingController waterTarget = TextEditingController();
  TextEditingController caloryTarget = TextEditingController();
  TextEditingController smokePrice = TextEditingController();
  TextEditingController smokeCount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("YAPIM AŞAMASINDA"),
            )
          ],
        ),
      ),
    );
  }
}
