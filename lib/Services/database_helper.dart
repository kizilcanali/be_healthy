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

  Future<List> getSummaryTable() async {
    var db = await instance.database;
    var resultSummary = await db.rawQuery("SELECT * FROM summary");
    return resultSummary;
  }

  Future<void> removeAll() async {
    var db = await instance.database;
    await db.delete("summary");
  }

  Future<void> insertWater(String date, int currentAmount, int target) async {
    var db = await instance.database;
    var check = await db.rawQuery("SELECT * FROM water WHERE date = ?", [date]);
    if (check.length == 0) {
      await db.rawQuery(
          "INSERT INTO water (date, current_amount, target) values (?,?,?)",
          [date, currentAmount, target]);
    } else {
      await db.rawQuery(
          "UPDATE water SET current_amount = ? WHERE date = ?", [date]);
    }
  }

  Future<List> getWaterTable() async {
    var db = await instance.database;
    var waterSummary = await db.rawQuery("SELECT * FROM water");
    return waterSummary;
  }

  Future<void> removeWaterHistory() async {
    var db = await instance.database;
    await db.delete("water");
  }
}
