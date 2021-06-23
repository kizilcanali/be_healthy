import 'dart:async';
import 'package:be_healthy/Services/database_helper.dart';
import 'package:be_healthy/Utilities/constants.dart';
import 'package:be_healthy/state_management.dart';
import 'package:flutter/foundation.dart';
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

  double smokePriceText = 0;
  double smokeAmountText = 0;
  String smokePriceTextString = "0";
  String smokeAmountTextString = "0";
  bool isClicked = false;

  List savedSmokeTimeTable = [];
  List forCheckIsClicked = [];
  int isClickedValue;
  Timer t;
  DateTime timeFromDB;
  String totalString = "";

  @override
  void initState() {
    super.initState();

    getInitialValues();

    t = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          if (isClickedValue == 1) {
            startStopWatch();

            if (context.read<Store>().smokeCount != 0 &&
                startStopWatch() % 60 == 0) {
              smokeAmountTextString =
                  ((context.read<Store>().smokeCount / 1440) *
                          (startStopWatch() / 60))
                      .toString();
            }

            /*smokePriceTextString = minutelyInfoCalculator(
                context.read<Store>().smokePrice, smokePriceText);

            smokePriceText = double.parse(smokePriceTextString);*/
          } else {
            totalString = "00:00:00:00:00:00";
            smokePriceTextString = "0";
            smokeAmountTextString = "0";
          }
        });
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
    //print(savedSmokeTimeTable);
  }

  int startStopWatch() {
    var nowDate = DateTime.now();
    timeFromDB = DateTime.parse(savedSmokeTimeTable[0]["saved_time"]);

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

    totalString = "$yearStr:$monthStr:$dayStr:$hourStr:$minutesStr:$secondsStr";
    return difference;
  }

  void resetTimer() async {
    await dbHelper.updateSavedTime();
  }

  String minutelyInfoCalculator(int fromStateTarget, double text) {
    double oneMinAmount = 0;
    double howMuchMinHave = startStopWatch() / 60;
    if (fromStateTarget == 0) {
      text = 0;
    } else {
      oneMinAmount = (fromStateTarget / 1440);
      //print("one min amount: $oneMinAmount");
      if ((startStopWatch() % 60) == 0) {
        text = oneMinAmount * howMuchMinHave;
      }
    }
    //print("selam ben text: $text");
    return text.toString();
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
            totalString,
            style: TextStyle(
              color: Color(0xFFFA4A0C),
              fontSize: 48,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var newState;

              if (isClickedValue == 0) {
                newState = await dbHelper.insertIsClicked(1);
                await dbHelper.insertSavedTimeToDB();
                print("if = 0 isClicked $newState");
                getInitialValues();
              } else {
                newState = await dbHelper.insertIsClicked(0);
                resetTimer();

                print("if = 1 isClicked $newState");
              }

              setState(() {
                isClickedValue = newState;
              });
            },
            child: isClickedValue == 0 || isClickedValue == null
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
                    smokeAmountTextString,
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
                    smokePriceTextString,
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
