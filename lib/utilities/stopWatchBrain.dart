import 'dart:async';

import 'package:be_healthy/Services/database_helper.dart';

Stream<int> stopWatchStream() {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  StreamController<int> streamController;
  Timer timer;
  Duration timeInterval = Duration(seconds: 1);
  int counter = 0;

  void tick(_) {
    counter += 1;
    streamController.add(counter);
  }

  void startStopWatch() async {
    //timer = Timer.periodic(timeInterval, tick);
    List savedTime = await dbHelper.getSavedSmokeTime();
    var nowDate = DateTime.now();
    DateTime timeFromDB = DateTime.parse(savedTime[0]["saved_time"]);
    var difference = nowDate.difference(timeFromDB).inSeconds;
  }

  void stopStopWatch() {
    if (timer != null) {
      timer.cancel();
      timer = null;
      counter = 0;
      streamController.close();
    }
  }

  streamController =
      StreamController<int>(onListen: startStopWatch, onCancel: stopStopWatch);

  return streamController.stream;
}
