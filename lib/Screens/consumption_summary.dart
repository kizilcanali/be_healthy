import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class ConsumptionSummary extends StatelessWidget {
  List<Text> deneme = [
    Text('ŞUNU BUNU'),
    Text('ŞUNU BUNU'),
    Text('ŞUNU BUNU'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ama Yarrak Yersin!'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: deneme.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return dailySummaryCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//  []   Dinamik olarak gün ve içerisindeki kaloriler toplamı gelecek.
//  []   Renk ve ikon ona göre değişecek.

  GestureDetector dailySummaryCard() {
    return GestureDetector(
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: BuildContext(context) => ExpansionPanel()));
      },
      child: Stack(
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(
            left: 25,
            top: 65,
            child: Row(
              children: [
                Text(
                  '25 Nisan',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                Text(
                  '2000kcal',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 165,
            bottom: 60,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Icon(
                  FontAwesome.smile_o,
                  size: 65,
                  color: Colors.green,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
