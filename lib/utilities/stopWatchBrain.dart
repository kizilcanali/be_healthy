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

  void startStopWatch() {
    //timer = Timer.periodic(timeInterval, tick);
    var savedTime = dbHelper.getSavedSmokeTime();
    var nowDate = DateTime.now();
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
