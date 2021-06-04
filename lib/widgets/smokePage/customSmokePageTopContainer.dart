import 'dart:async';
import 'package:be_healthy/Utilities/constants.dart';
import 'package:be_healthy/Utilities/stopWatchBrain.dart';
import 'package:flutter/material.dart';

class CustomSmokePageTopContainer extends StatefulWidget {
  const CustomSmokePageTopContainer({
    Key key,
  }) : super(key: key);

  @override
  _CustomSmokePageTopContainerState createState() =>
      _CustomSmokePageTopContainerState();
}

class _CustomSmokePageTopContainerState
    extends State<CustomSmokePageTopContainer> {
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hourStr = "00";
  String minutesStr = "00";
  String secondsStr = "00";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: Color(0xFF242C38),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Icon(
            Icons.smoke_free,
            color: Color(0xFFD14818),
            size: 92,
          ),
          Text(
            "$hourStr:$minutesStr:$secondsStr",
            style: TextStyle(
              color: Color(0xFFFA4A0C),
              fontSize: 48,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              timerStream = stopWatchStream();
              timerSubscription = timerStream.listen((int newTick) {
                setState(() {
                  hourStr = ((newTick / (60 * 60)) % 60)
                      .floor()
                      .toString()
                      .padLeft(2, "0");
                  minutesStr =
                      ((newTick / 60) % 60).floor().toString().padLeft(2, "0");
                  secondsStr =
                      (newTick % 60).floor().toString().padLeft(2, "0");
                });
              });
            },
            child: Text("BAS BANA"),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "25",
                    style: kSmokePageParameterStyleNumeric,
                  ),
                  Text(
                    "Sigara İçilmedi",
                    style: kSmokePageParameterStyleText,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "20TL",
                    style: kSmokePageParameterStyleNumeric,
                  ),
                  Text(
                    "Kurtarıldı",
                    style: kSmokePageParameterStyleText,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
