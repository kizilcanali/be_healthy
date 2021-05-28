import 'package:flutter/cupertino.dart';

class Store extends ChangeNotifier {
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

  //Nav index get func
  int get buttomNavIndex => _buttomNavIndex;
  //Water get funcs
  int get currentAmount => _currentAmount;
  int get target => _target;
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
      this._summaryWater);

  void newSummaryWater(List newWater) {
    _summaryWater = newWater;
    notifyListeners();
  }

  void newCurrentAmount(int currentWaterAmount) {
    _currentAmount = currentWaterAmount;
    notifyListeners();
  }

  void newTarget(int targetWater) {
    _target = targetWater;
    notifyListeners();
  }

  void trackNavIndexState(int pushedIndex) {
    _buttomNavIndex = pushedIndex;
    notifyListeners();
  }

  void newMeals(List newList) {
    _mealsFromDBState = newList;
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
    //print(_summaryFoods);
    notifyListeners();
  }

  void addWaterToSummary(int currentAmount) {
    _summaryWater[_summaryWater.length - 1]["current_amount"] += currentAmount;
    _currentAmount = _summaryWater[_summaryWater.length - 1]["current_amount"];
    notifyListeners();
  }
}
