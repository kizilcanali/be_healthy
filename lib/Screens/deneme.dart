import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      title: CustomSummaryCard(date: '25Nisan', calory: '12312'),
      trailing: SizedBox.shrink(),
      children: [
        ListTile(
          title: Text('DENEME DENEME DENEME'),
          subtitle: const Text('To delete this panel, tap the trash can icon'),
        ),
      ],
    );
    /*return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return CustomSummaryCard(date: '25 Nisan', calory: '1222');
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );*/
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
