import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  static List<String> denemeListesi = [
    'Alinazik',
    'Karnıyarık',
    'Hoşaf',
    'Cacık',
    'İskender',
    'Adana Dürüm',
  ];
  static List<String> Icecekler = [
    'Ayran',
    'Kola',
    'Şalgam',
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
            icon: Icon(
              Icons.person,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
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
            Expanded(
              child: DefaultTabController(
                length: 5,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Color(0xFFFA4A0C),
                  unselectedLabelColor: Color(0XFF9A9A9D),
                  indicatorColor: Color(0xFFFA4A0C),
                  indicatorWeight: 3,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  tabs: [
                    Tab(
                      text: 'Kırmızı Et',
                    ),
                    Tab(
                      text: 'İçecekler',
                    ),
                    Tab(
                      text: 'Çok Tüketilen',
                    ),
                    Tab(
                      text: 'Beyaz Et',
                    ),
                    Tab(
                      text: 'Tatlı',
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
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Padding foodCards(String foodName) {
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
                  foodName,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '1200kcal',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFA4A0C)),
                  ),
                ),
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
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      //En Üstteki Büyük Yazı
      alignment: Alignment.centerLeft,
      child: Text('Eat Healthy Stay Healthy',
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          )),
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
      margin: EdgeInsets.only(top: 20),
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

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      iconSize: 32,
      elevation: 0,
      showSelectedLabels: false,
      selectedItemColor: Color(0xFFFA4A0C),
      unselectedItemColor: Color(0xFFB1B1B3),
      items: [
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFF2F2F2),
          icon: Icon(
            Ionicons.md_home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFF2F2F2),
          icon: Icon(Ionicons.ios_water),
          label: 'Water',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFF2F2F2),
          icon: Icon(Ionicons.logo_no_smoking),
          label: 'Smoke',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFF2F2F2),
          icon: Icon(Ionicons.md_bookmark),
          label: 'Summary',
        ),
      ],
    );
  }
}
