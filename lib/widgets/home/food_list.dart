import 'package:flutter/material.dart';
import 'custom_food_cart.dart';

class food_list extends StatelessWidget {
  const food_list({
    Key key,
    @required this.tempMealList,
  }) : super(key: key);

  final List tempMealList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        itemCount: tempMealList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return FoodCard(meal: tempMealList, index: index);
        },
      ),
    );
  }
}
