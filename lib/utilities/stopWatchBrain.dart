import 'dart:async';
import 'package:be_healthy/Services/database_helper.dart';

class StopWatchBrain {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
/*
  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timeInterval = Duration(seconds: 1);
    int counter = 0;

    void tick(_) {
      counter++;
      streamController.add(counter);
    }

   void startStopWatch() {
      timer = Timer.periodic(timeInterval, tick);
    }

    void stopStopWatch() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    streamController = StreamController<int>(
        onListen: startStopWatch, onCancel: stopStopWatch);

    return streamController.stream;
  }*/
}
