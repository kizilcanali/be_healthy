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

  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String yearStr = "00";
  String monthStr = "00";
  String dayStr = "00";
  String hourStr = "00";
  String minutesStr = "00";
  String secondsStr = "00";
  bool isClicked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var t = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        setState(
          () {
            startStopWatch();
          },
        );
      },
    );
  }

  Future<int> startStopWatch() async {
    List savedTime = await dbHelper.getSavedSmokeTime();
    var nowDate = DateTime.now();
    DateTime timeFromDB = DateTime.parse(savedTime[0]["saved_time"]);
    var difference = nowDate.difference(timeFromDB).inSeconds;
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
              setState(() {
                isClicked = !isClicked;
              });

              await dbHelper
                  .insertSavedTimeToDB(); //Save current time to db when pressed to the butt

              /* timerStream = stopWatchStream();
              timerSubscription = timerStream.listen((int newTick) {
                setState(() {
                  yearStr = (newTick / (60 * 60 * 24 * 365) % 60)
                      .floor()
                      .toString()
                      .padLeft(2, "0");
                  monthStr = (newTick / (60 * 60 * 24 * 30) % 60)
                      .floor()
                      .toString()
                      .padLeft(2, "0");
                  dayStr = ((newTick / (60 * 60 * 24) % 60)
                      .floor()
                      .toString()
                      .padLeft(2, "0"));
                  hourStr = ((newTick / (60 * 60)) % 60)
                      .floor()
                      .toString()
                      .padLeft(2, "0");
                  minutesStr =
                      ((newTick / 60) % 60).floor().toString().padLeft(2, "0");
                  secondsStr =
                      (newTick % 60).floor().toString().padLeft(2, "0");
                  print("($newTick % 60 = $secondsStr");
                });
              });*/
            },
            child: context.watch<Store>().isClicked
                ? Text("Zamanı Sıfırla")
                : Text("Sayacı Başlat"),
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
