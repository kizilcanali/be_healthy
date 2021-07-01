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
  List smokeProgressStatTable = [];
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
            double oneMinAmountCount = context.read<Store>().smokeCount / 1440;
            double oneMinAmountPrice = context.read<Store>().smokePrice / 1440;
            if (startStopWatch() % 60 == 0) {
              smokeAmountText = oneMinAmountCount * (startStopWatch() / 60);
              smokePriceText = oneMinAmountPrice * (startStopWatch() / 60);
              saveStatsToDB(smokePriceText, smokeAmountText);
            }
            context.read<Store>().setDifferenceBetweenTime(startStopWatch());
          } else {
            totalString = "00:00:00:00:00:00";
            smokePriceTextString = "0";
            smokeAmountTextString = "0";
          }
        });
      },
    );
  }

  Future<void> getInitialValues() async {
    savedSmokeTimeTable = await dbHelper.getSavedSmokeTime();
    smokeProgressStatTable = await dbHelper.getSmokeProgressData();

    isClickedValue = savedSmokeTimeTable[0]["is_clicked"];
    smokeAmountText = (smokeProgressStatTable[0]["smoke_count"]).toDouble();
    smokePriceText = (smokeProgressStatTable[0]["smoke_price"]).toDouble();
  }

  void saveStatsToDB(double price, double count) async {
    await dbHelper.updateSmokeProgressData(price, count);
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
    await dbHelper.updateSmokeProgressData(0, 0);

    setState(() {
      smokeAmountText = 0;
      smokePriceText = 0;
    });
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
                getInitialValues();
              } else {
                newState = await dbHelper.insertIsClicked(0);
                resetTimer();
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
                    smokeAmountText.toString(),
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
                    smokePriceText.toString() + "TL",
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

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }
}
