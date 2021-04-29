import 'package:be_healthy/utilities/constants.dart';
import 'package:be_healthy/widgets/button/eat_button_in_detail.dart';
import 'package:be_healthy/widgets/button/home_custom_icon_button.dart';
import 'package:be_healthy/widgets/custom_food_cart.dart';
import 'package:be_healthy/widgets/food_detail/food_detail_page.dart';
import 'package:be_healthy/widgets/food_list.dart';
import 'package:be_healthy/widgets/navbar/bottom_nav_bar.dart';
import 'package:be_healthy/widgets/custom_search_bar.dart';
import 'package:be_healthy/widgets/custom_title_for_main_page.dart';
import 'package:be_healthy/widgets/photo_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:be_healthy/widgets/custom_table_cell_item.dart';

class Home extends StatefulWidget {
  final List mealsFromDB;
  final List categories;

  const Home({Key key, this.mealsFromDB, this.categories}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List tempMealList = [];

  @override
  void initState() {
    super.initState();
    filterMealsByCategory(0);
  }

  /** tab index  eşitse gelen yemek kategori  */
  void filterMealsByCategory(int index) {
    tempMealList = [];
    for (int i = 0; i < widget.mealsFromDB.length; i++) {
      if (widget.mealsFromDB[i]["category"] ==
          widget.categories[index]["category"]) {
        tempMealList.add(widget.mealsFromDB[i]);
      }
    }
    //print(widget.categories);
  }

  List<Tab> tabList(List cat) {
    List<Tab> temp = [];
    for (int i = 0; i < widget.categories.length; i++) {
      temp.add(
        Tab(
          text: cat[i]["category"],
        ),
      );
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [custom_icon_button_home()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomTitleForMainPage(),
            ),
            Expanded(
              child: CustomSearchBar(),
            ),
            //Category selection place.
            DefaultTabController(
              length: widget.categories.length,
              child: TabBar(
                  labelStyle: TextStyle(fontSize: 19),
                  isScrollable: true,
                  labelColor: Color(0xFFFA4A0C),
                  unselectedLabelColor: Color(0XFF9A9A9D),
                  indicatorColor: Color(0xFFFA4A0C),
                  indicatorWeight: 3,
                  onTap: (index) {
                    setState(
                      () {
                        currentIndex = index;
                        filterMealsByCategory(currentIndex);
                      },
                    );
                  },
                  tabs: tabList(widget.categories)),
            ),
            //Listed food cards.
            food_list(tempMealList: tempMealList)
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
