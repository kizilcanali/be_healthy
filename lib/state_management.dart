import 'package:flutter/cupertino.dart';
import 'Services/database_helper.dart';

class Store extends ChangeNotifier {
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  //Navbar index
  int _buttomNavIndex;
  //Food part
  List<dynamic> _mealsFromDBState;
  List<dynamic> _categories;
  List<dynamic> _summaryFoods;
  //Water part
  List<dynamic> _summaryWater;
  int _currentAmount;
  int _target;
  int _caloryTarget;
  int _smokeCount;
  int _smokePrice;

  //Smoke
  List<dynamic> _smokeProgressData;

  //Smoke get func
  List<dynamic> get smokeProgressData => _smokeProgressData;

  //Nav index get func
  int get buttomNavIndex => _buttomNavIndex;

  //Water get funcs
  int get currentAmount => _currentAmount;
  int get target => _target;
  int get caloryTarget => _caloryTarget;
  int get smokeCount => _smokeCount;
  int get smokePrice => _smokePrice;
  List<dynamic> get summaryWater => _summaryWater;

  //Food get funcs
  List<dynamic> get mealsFromDBState => _mealsFromDBState;
  List<dynamic> get categories => _categories;
  List<dynamic> get summaryFoods => _summaryFoods;

  Store(
      this._buttomNavIndex,
      this._mealsFromDBState,
      this._categories,
      this._summaryFoods,
      this._currentAmount,
      this._target,
      this._summaryWater,
      this._caloryTarget,
      this._smokeCount,
      this._smokePrice,
      this._smokeProgressData);

  void newSmokeProgress(List smokeProgress) async {
    _smokeProgressData = smokeProgress;
    notifyListeners();
  }

  //TARGET SETTERS
  void newCaloryTarget(int caloryTarget) async {
    _caloryTarget = caloryTarget;
    await dbHelper.updateTargetValue("calory", _caloryTarget);
    notifyListeners();
  }

  void newSmokeCount(int smokeCount) async {
    _smokeCount = smokeCount;
    await dbHelper.updateTargetValue("smoke_count", _smokeCount);
    notifyListeners();
  }

  void newSmokePrice(int smokePrice) async {
    _smokePrice = smokePrice;
    await dbHelper.updateTargetValue("smoke_price", _smokePrice);
    notifyListeners();
  }

  void newTarget(int targetWater) async {
    _target = targetWater;
    //print("state management _target value: $_target");
    await dbHelper.updateTargetValue("water", _target);
    await dbHelper.updateLastTarget(_target);
    print("_summaryWater: $_summaryWater");
    _summaryWater[_summaryWater.length - 1]["target"] = _target;
    notifyListeners();
  }

  void newSummaryWater(List newWater) {
    _summaryWater = newWater;
    notifyListeners();
  }

  void newCurrentAmount(int currentWaterAmount) {
    _currentAmount = currentWaterAmount;
    notifyListeners();
  }

  void trackNavIndexState(int pushedIndex) {
    _buttomNavIndex = pushedIndex;
    notifyListeners();
  }

  void newMeals(List newList) {
    _mealsFromDBState = newList;
    //print(_mealsFromDBState);
    notifyListeners();
  }

  void newCategories(List newCategories) {
    _categories = newCategories;
    notifyListeners();
  }

  void newSummaryFoods(List newSummaryFoods) {
    _summaryFoods = newSummaryFoods;
    notifyListeners();
  }

  void addFoodsToSummary(String day, dynamic foodObject) {
    //print("Foodobject: $foodObject");
    if (_summaryFoods.length > 0 &&
        _summaryFoods[_summaryFoods.length - 1]["date"] == day) {
      _summaryFoods[_summaryFoods.length - 1]["foods"].add(foodObject);
    } else {
      _summaryFoods.add(
        {
          "date": day,
          "foods": [foodObject]
        },
      );
    }
    notifyListeners();
  }

  void addWaterToSummary(int currentAmount) {
    if (_target != 0) {
      _summaryWater[_summaryWater.length - 1]["current_amount"] +=
          currentAmount;
      newCurrentAmount(
          _summaryWater[_summaryWater.length - 1]["current_amount"]);
      dbHelper.updateCurrentAmount(_currentAmount);
    }

    //print(_summaryWater);
    notifyListeners();
  }
}
