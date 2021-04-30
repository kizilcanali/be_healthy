import 'package:flutter/cupertino.dart';

class Store extends ChangeNotifier {
  int _buttomNavIndex;
  List<dynamic> _mealsFromDBState;
  List<dynamic> _categories;

  int get buttomNavIndex => _buttomNavIndex;
  List<dynamic> get mealsFromDBState => _mealsFromDBState;
  List<dynamic> get categories => _categories;

  Store(this._buttomNavIndex, this._mealsFromDBState, this._categories);

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
}
