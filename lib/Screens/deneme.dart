import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lottie/lottie.dart';

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F8),
      body: SafeArea(child: MyStatefulWidget()),
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = [
    Item(expandedValue: 'Deneme', headerValue: 'Kafası'),
    Item(expandedValue: 'Deneme2', headerValue: 'Kafası2'),
    Item(expandedValue: 'Deneme3', headerValue: 'Kafası3'),
    Item(expandedValue: 'Deneme4', headerValue: 'Kafası4'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.symmetric(vertical: 20),
          //tilePadding: EdgeInsets.symmetric(vertical: 10),
          /*leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset(
              'images/logo.png',
              height: 90,
            ),
          ),*/
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          title: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset(
                'images/okayicon.json',
                width: 100,
                height: 100,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '26 Nisan 21',
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

          children: [Text('Haydar'), Text('Berk')],
        ),
      ),
    );
  }
}

class CustomSummaryCard extends StatelessWidget {
  const CustomSummaryCard({
    Key key,
    @required this.date,
    @required this.calory,
  }) : super(key: key);

  final String date;
  final String calory;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.green.shade500,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Positioned(
          left: 25,
          top: 65,
          child: Row(
            children: [
              Text(
                date,
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
                '$calory kcal',
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
    );
  }
}
