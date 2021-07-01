import 'package:be_healthy/Widgets/profilePage/customProfileParameterCard.dart';
import 'package:be_healthy/state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomProfileParameterEditCard(
                topic: "Kalori Hedefi",
                textValue: context.watch<Store>().caloryTarget.toString(),
                stateChanger: context.read<Store>().newCaloryTarget,
              ),
              CustomProfileParameterEditCard(
                topic: "Su İçme Hedefi",
                textValue: context.watch<Store>().target.toString(),
                stateChanger: context.read<Store>().newTarget,
              ),
              CustomProfileParameterEditCard(
                topic: "İçilen Sigara",
                textValue: context.watch<Store>().smokeCount.toString(),
                stateChanger: context.read<Store>().newSmokeCount,
              ),
              CustomProfileParameterEditCard(
                topic: "Sigara Fiyatı",
                textValue: context.watch<Store>().smokePrice.toString(),
                stateChanger: context.read<Store>().newSmokePrice,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
