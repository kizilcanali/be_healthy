import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  static List<String> denemeListesi = [
    'ALİBAZİK',
    'dENEME',
    'dENEME',
    'dENEME',
    'dENEME',
  ];
  static List<String> Icecekler = [
    'Kola',
    'Kola',
    'Kola',
  ];
  List<List<String>> categorie = [denemeListesi, Icecekler];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.people, color: Colors.grey),
              onPressed: () {},
            )
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: CustomTitleForMainPage()),
              Expanded(child: CustomSearchBar()),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Colors.orange,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.orange,
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    tabs: [
                      Tab(
                        text: 'Yiyecekler',
                      ),
                      Tab(
                        text: 'İçecekler',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    itemCount: categorie[currentIndex].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return foodCards(categorie[currentIndex][index]);
                    }),
              )
            ],
          ),
        ));
  }

  Padding foodCards(String yemekAdi) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 220,
            //padding: EdgeInsets.only(left: 12, top: 100, right: 12, bottom: 12),
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  yemekAdi,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('1200kcal'),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 5,
            right: 5,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://source.unsplash.com/random',
              ),
              radius: 80,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTitleForMainPage extends StatelessWidget {
  const CustomTitleForMainPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //En Üstteki Büyük Yazı
      alignment: Alignment.centerLeft,
      child: Text(
        'Buraya Bir Text Gelecek!',
        style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //onTap: (i) {},
      currentIndex: 0,
      backgroundColor: Color(0xFFF2F2F2),
      iconSize: 32,
      elevation: 0,
      showSelectedLabels: false,
      selectedItemColor: Color(0xFFFA4A0C),
      unselectedItemColor: Color(0xFFB1B1B3),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.md_home,
          ),
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
