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

  void addFoodsToSummary(String day, dynamic foodObject) {
    //print("Foodobject: $foodObject");
    if (_summaryFoods.length > 0 &&
        _summaryFoods[_summaryFoods.length - 1]["date"] == day) {
      _summaryFoods[_summaryFoods.length - 1]["foods"].add(foodObject);
    } else {
      print("buraya girdi uyii");
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
}
