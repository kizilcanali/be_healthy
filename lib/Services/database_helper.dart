import 'dart:io';
import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class DatabaseHelper {
  static final _databaseName = 'grad_project_db.db';
  static final table = 'nutrition_values';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(join("assets/database", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flust the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print('Opening existing database');
    }

    return await openDatabase(path);
  }

  Future<List> getRandomMealsByCategory() async {
    var db = await instance.database;
    var result = await db.rawQuery("SELECT * FROM $table ");
    return result;
  }

  Future<List> getCategories() async {
    var db = await instance.database;
    var resultCategories =
        await db.rawQuery("SELECT DISTINCT category FROM $table");
    return resultCategories;
  }

  Future<void> insertSummary(String date, String food) async {
    var db = await instance.database;
    var check =
        await db.rawQuery("SELECT * FROM summary WHERE date = ?", [date]);
    if (check.length == 0) {
      await db.rawQuery(
          "INSERT INTO summary (date, foods) values(?,?)", [date, food]);
    } else {
      await db.rawQuery(
          "UPDATE summary SET foods = ? WHERE date = ? ", [food, date]);
    }
  }

  //GET SMOKE PROGRESS TABLE ELEMENTS
  Future<List> getSmokeProgressTable() async {
    var db = await instance.database;
    var smokeProgressList = db.rawQuery("SELECT * FROM smoke_progress");

    return smokeProgressList;
  }

  Future<List> getSummaryTable() async {
    var db = await instance.database;
    var resultSummary = await db.rawQuery("SELECT * FROM summary");
    return resultSummary;
  }

  //Clear summary table.
  Future<void> removeAll() async {
    var db = await instance.database;
    await db.delete("summary");
  }

  Future<void> insertWater(int currentAmount, int target) async {
    var db = await instance.database;
    var check =
        await db.rawQuery("SELECT * FROM water WHERE date = ?", [getDate()]);
    if (check.length == 0) {
      await db.rawQuery(
          "INSERT INTO water (date, current_amount, target) values (?,?,?)",
          [getDate(), currentAmount, target]);
    }
  }

  //Update the current amount that the day we are in.
  Future<void> updateCurrentAmount(int currentAmount) async {
    var db = await instance.database;
    await db.rawQuery("UPDATE water SET current_amount = ? WHERE date = ?",
        [currentAmount, getDate()]);
  }

  //Get water table elements.
  Future<List> getWaterTable() async {
    var db = await instance.database;
    var waterSummary = await db.rawQuery("SELECT * FROM water");
    return waterSummary;
  }

  Future<void> removeWaterHistory() async {
    var db = await instance.database;
    await db.delete("water");
  }

  //Assign 0 to all targets table elements initially.
  Future<void> initialTargetAssigner() async {
    var db = await instance.database;
    await db.rawQuery("INSERT INTO targets values (0,0,0,0)");
  }

  Future<void> insertSavedTimeToDB() async {
    var db = await instance.database;
    var now = DateTime.now();
    String nowDate = now.toString();
    /*String nowDate = now.year.toString().padLeft(2, "0") +
        ":" +
        now.month.toString().padLeft(2, "0") +
        ":" +
        now.day.toString().padLeft(2, "0") +
        ":" +
        now.hour.toString().padLeft(2, "0") +
        ":" +
        now.minute.toString().padLeft(2, "0") +
        ":" +
        now.second.toString().padLeft(2, "0");
*/
    List isExist = await getSavedSmokeTime();
    if (isExist.length != 0) {
      print("varsa");
      await db
          .rawQuery("UPDATE smoke_time_progress SET saved_time = ?", [nowDate]);
    } else {
      print("yoksa");
      await db.rawQuery(
          "INSERT INTO smoke_time_progress (saved_time) values (?)", [nowDate]);
    }
  }

  Future<List> getSavedSmokeTime() async {
    var db = await instance.database;
    var savedTime = await db.rawQuery("SELECT * FROM smoke_time_progress");
    return savedTime;
  }

  //Update the water table's last element's target value.
  Future<void> updateLastTarget(int newTarget) async {
    var db = await instance.database;
    await db.rawQuery(
        "UPDATE water SET target = ? WHERE date = ?", [newTarget, getDate()]);
  }

  // Assign the new value to selected target column.
  Future<void> updateTargetValue(String selectedTarget, int target) async {
    var db = await instance.database;
    await db.rawQuery("UPDATE targets SET $selectedTarget = ?", [target]);
  }

  //Get the selected target (which you want to reach eg. calory, water) from targets table.
  Future<int> getTargets(String selectedTarget) async {
    var db = await instance.database;
    var targets = await db.rawQuery("SELECT $selectedTarget FROM targets");
    //print("targets : $targets");
    if (targets.length != 0) {
      return targets[0][selectedTarget];
    }
    return 0;
  }

  //Is Target table empty if yes return true.
  Future<bool> isTargetEmpty() async {
    var db = await instance.database;
    var targets = await db.query("targets");
    //print("targets from db: $targets");
    return targets.length == 0;
  }

  String getDate() {
    var nowDate = DateTime.now();
    String day = nowDate.day.toString() + " / " + nowDate.month.toString();
    return day;
  }
}
