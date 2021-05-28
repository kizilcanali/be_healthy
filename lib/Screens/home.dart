import 'package:be_healthy/widgets/food_list.dart';
import 'package:be_healthy/widgets/custom_search_bar.dart';
import 'package:be_healthy/widgets/custom_title_for_main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_management.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List tempMealList = [];
  Map<String, dynamic> consumedFoods;

  @override
  void initState() {
    super.initState();
    filterMealsByCategory(0);
  }

  /* tab index  eşitse gelen yemek kategori  */
  void filterMealsByCategory(int index) {
    tempMealList = [];
    for (int i = 0; i < context.read<Store>().mealsFromDBState.length; i++) {
      if (context.read<Store>().mealsFromDBState[i]["category"] ==
          context.read<Store>().mealsFromDBState[index]["category"]) {
        tempMealList.add(context.read<Store>().mealsFromDBState[i]);
      }
    }
  }

  List<Tab> tabList(List cat) {
    List<Tab> temp = [];
    for (int i = 0; i < context.read<Store>().categories.length; i++) {
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
    return SafeArea(
      child: Center(
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
              length: context.read<Store>().categories.length,
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
                  tabs: tabList(context.read<Store>().categories)),
            ),
            //Listed food cards.
            food_list(tempMealList: tempMealList)
          ],
        ),
      ),
    );
  }
}
