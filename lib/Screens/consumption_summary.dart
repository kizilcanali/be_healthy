import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../state_management.dart';

class ConsumptionSummary extends StatefulWidget {
  @override
  _ConsumptionSummaryState createState() => _ConsumptionSummaryState();
}

class _ConsumptionSummaryState extends State<ConsumptionSummary> {
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    List sumFoods = context.read<Store>().summaryFoods;

    return ListView.builder(
      shrinkWrap: true,
      //physics: BouncingScrollPhysics(),
      //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      itemCount: sumFoods.length,
      //scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return _expandableSummaryCard(
            sumFoods[index]["date"], sumFoods[index]["foods"]);
      },
    );
  }

  // [] Detay içerisindeki itemler dinamik gelecek
  // [] Detaydaki toplamlar yukarıya yazdırılacak
  // [] Tarihe göre gruplandırma yapılacak.

  Widget _expandableSummaryCard(String dateText, Map<String, dynamic> foods) {
    String lottieIconName;
    String totalCaloryText;
    //print(foods);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ExpansionTile(
          //childrenPadding: EdgeInsets.symmetric(vertical: 20),
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          title: Row(
            children: [
              Lottie.asset(
                'assets/images/okayicon.json',
                width: 100,
                height: 100,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1500kcal',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFA4A0C)),
                    )
                  ],
                ),
              ),
            ],
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              itemCount: foods["foods"].length,
              //scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      foods["foods"][index]["name"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(foods["foods"][index]["calorie"].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
