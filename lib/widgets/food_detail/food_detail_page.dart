import 'package:be_healthy/widgets/button/eat_button_in_detail.dart';
import 'package:flutter/material.dart';
import 'package:be_healthy/utilities/constants.dart';

import '../custom_table_cell_item.dart';
import '../photo_hero.dart';

class FoodDetail extends StatelessWidget {
  FoodDetail({this.meal, this.index});

  dynamic meal;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F9),
      body: SafeArea(
        child: Column(
          children: [
            PhotoHero(
              child: Image.network(
                'https://source.unsplash.com/random',
                width: double.infinity,
                height: 320,
              ),
              photo: 'tag',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: 20,
            ),
            // Food's Name
            Column(
              children: [
                Text(
                  meal[index]["name"],
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                //Food's Calorie
                Text(
                  meal[index]["calorie"].toString() + ' kcal',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFA4A0C),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                Table(
                  //Nutrition value names, underlines and nutrition numeric values.
                  children: [
                    TableRow(
                      children: [
                        CustomTableCellItem(
                          text: 'Protein',
                          customTextStyle: kDetailPageTextStyle,
                        ),
                        CustomTableCellItem(
                          text: 'Karbonhidrat',
                          customTextStyle: kDetailPageTextStyle,
                        ),
                        CustomTableCellItem(
                          text: 'Yağ',
                          customTextStyle: kDetailPageTextStyle,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 4,
                          endIndent: 4,
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        CustomTableCellItem(
                          text: meal[index]["protein"].toString(),
                          customTextStyle: kDetailPageNumericValuesStyles,
                        ),
                        CustomTableCellItem(
                          text: meal[index]["carhbohydrate"].toString(),
                          customTextStyle: kDetailPageNumericValuesStyles,
                        ),
                        CustomTableCellItem(
                          text: meal[index]["fat"].toString(),
                          customTextStyle: kDetailPageNumericValuesStyles,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            InDetailEatButton(),
          ],
        ),
      ),
    );
  }
}
