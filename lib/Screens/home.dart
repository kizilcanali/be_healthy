import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Widget> texts = [
      Text('A'),
      Text('B'),
      Text('C'),
    ];
    List<String> texts2 = [
      ' Text(A)',
      'Text(B)',
      'Text(C)',
    ];
    int currentIndex = 0;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //Geçici
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            //En Üstteki Büyük Yazı
            alignment: Alignment.centerLeft,
            child: Text(
              'Buraya Bir Text Gelecek!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            // Search Bar
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFEFEEEE),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Color(0xFF787777),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: 120,
              children: [
                CustomListViewItem(
                  title: 'Çok Tüketilen',
                  textColor: Color(0xFFFA4A0C),
                ),
                CustomListViewItem(
                  title: 'Çok Tüketilen',
                  textColor: Color(0xFF9A9A9D),
                ),
                CustomListViewItem(
                  title: 'Çok Tüketilen',
                  textColor: Color(0xFF9A9A9D),
                ),
                CustomListViewItem(
                  title: 'Çok Tüketilen',
                  textColor: Color(0xFF9A9A9D),
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        elevation: 0,
        showSelectedLabels: false,
        selectedItemColor: Color(0xFFFA4A0C),
        unselectedItemColor: Color(0xFFB1B1B3),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.md_home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.ios_water),
            label: 'Water',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.logo_no_smoking),
            label: 'Smoke',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.md_bookmark),
            label: 'Summary',
          ),
        ],
      ),
    );
  }
}

// ListView's TextButton Elements
class CustomListViewItem extends StatefulWidget {
  String title;
  Color textColor;
  CustomListViewItem({this.title, this.textColor});

  @override
  _CustomListViewItemState createState() => _CustomListViewItemState();
}

class _CustomListViewItemState extends State<CustomListViewItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //print('isActive  $isActive');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            widget.title,
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.orange, width: 2),
          ),
        ),
      ),
    );
  }
}
/*DefaultTabController(
            length: 3,
            child: Container(
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                  print(currentIndex);
                },
                tabs: [
                  Tab(
                    text: 'DENEME',
                  ),
                  Tab(
                    text: 'DENEME',
                  ),
                  Tab(
                    text: 'DENEME',
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 200,
            child: Text(
              texts2[currentIndex],
            ),
          )*/ 