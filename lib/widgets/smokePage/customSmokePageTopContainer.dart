import 'dart:async';
import 'package:be_healthy/Services/database_helper.dart';
import 'package:be_healthy/Utilities/constants.dart';
import 'package:be_healthy/Utilities/stopWatchBrain.dart';
import 'package:be_healthy/state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  String yearStr = "00";
  String monthStr = "00";
  String dayStr = "00";
  String hourStr = "00";
  String minutesStr = "00";
  String secondsStr = "00";
  bool isClicked = false;
  List savedSmokeTimeTable = [];
  int isClickedValue;
  Timer t;
  @override
  void initState() {
    super.initState();
    getInitialValues();

    t = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        setState(
          () {
            if (isClickedValue == 1) {
              startStopWatch();
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    t.cancel();
  }

  Future<void> getInitialValues() async {
    savedSmokeTimeTable = await dbHelper.getSavedSmokeTime();
    isClickedValue = savedSmokeTimeTable[0]["is_clicked"];
    print("initteki saved db $savedSmokeTimeTable");
  }

  int startStopWatch() {
    var nowDate = DateTime.now();
    DateTime timeFromDB = DateTime.parse(savedSmokeTimeTable[0]["saved_time"]);
    var difference = nowDate.difference(timeFromDB).inSeconds;
    yearStr = (difference / (60 * 60 * 24 * 365) % 60)
        .floor()
        .toString()
        .padLeft(2, "0");
    monthStr = (difference / (60 * 60 * 24 * 30) % 60)
        .floor()
        .toString()
        .padLeft(2, "0");
    dayStr =
        ((difference / (60 * 60 * 24) % 60).floor().toString().padLeft(2, "0"));
    hourStr =
        ((difference / (60 * 60)) % 60).floor().toString().padLeft(2, "0");
    minutesStr = ((difference / 60) % 60).floor().toString().padLeft(2, "0");
    secondsStr = (difference % 60).floor().toString().padLeft(2, "0");

    return difference;
  }

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
            "$yearStr:$monthStr:$dayStr:$hourStr:$minutesStr:$secondsStr",
            style: TextStyle(
              color: Color(0xFFFA4A0C),
              fontSize: 48,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              //Save current time to db when pressed to the butt
              await dbHelper.insertSavedTimeToDB();
              var newState = isClickedValue == 0
                  ? await dbHelper.insertIsClicked(1)
                  : await dbHelper.insertIsClicked(0);

              setState(() {
                isClickedValue = newState;
              });

              //print(isClickedValue);
            },
            child: isClickedValue == 0
                ? Text("Sayacı Başlat")
                : Text("Sayacı Sıfırla"),
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
