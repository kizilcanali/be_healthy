import 'package:flutter/cupertino.dart';

class Store extends ChangeNotifier {
  int _buttomNavIndex;
  List<dynamic> _mealsFromDBState;
  List<dynamic> _categories;
  List<dynamic> _summaryFoods;

  int get buttomNavIndex => _buttomNavIndex;
  List<dynamic> get mealsFromDBState => _mealsFromDBState;
  List<dynamic> get categories => _categories;
  List<dynamic> get summaryFoods => _summaryFoods;

  Store(this._buttomNavIndex, this._mealsFromDBState, this._categories,
      this._summaryFoods);

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

  void addFoodsToSummary(dynamic foodObject) {
    _summaryFoods.add(foodObject);
    notifyListeners();
  }
}
