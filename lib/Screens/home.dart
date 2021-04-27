import 'package:be_healthy/utilities/constants.dart';
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
            DefaultTabController(
              length: 5,
              child: TabBar(
                labelStyle: TextStyle(fontSize: 19),
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
            Expanded(
              flex: 4,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                itemCount: categorie[currentIndex].length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return foodCards(categorie[currentIndex][index]);
                },
              ),
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
      child: InkWell(
        onTap: () {
          print('');
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: 220,
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
              child: PhotoHero(
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://source.unsplash.com/random'),
                  radius: 80,
                ),
                photo: 'https://source.unsplash.com/random',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
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
                                  photo: 'https://source.unsplash.com/random',
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Kuzu Çevirme',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      '2400kcal',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFFFA4A0C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(
                                          children: [
                                            CustomTableCellItem(
                                              text: 'Protein',
                                              customTextStyle:
                                                  kDetailPageTextStyle,
                                            ),
                                            CustomTableCellItem(
                                              text: 'Karbonhidrat',
                                              customTextStyle:
                                                  kDetailPageTextStyle,
                                            ),
                                            CustomTableCellItem(
                                              text: 'Yağ',
                                              customTextStyle:
                                                  kDetailPageTextStyle,
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
                                              text: '20g',
                                              customTextStyle:
                                                  kDetailPageNumericValuesStyles,
                                            ),
                                            CustomTableCellItem(
                                              text: '30g',
                                              customTextStyle:
                                                  kDetailPageNumericValuesStyles,
                                            ),
                                            CustomTableCellItem(
                                              text: '15g',
                                              customTextStyle:
                                                  kDetailPageNumericValuesStyles,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                /*SizedBox(
                                    //height: 100,
                                    ),*/
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 110, right: 50, left: 50),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Al Ağzına',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 63),
                                      primary: Color(0xFFFA4A0C),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTableCellItem extends StatelessWidget {
  String text;
  TextStyle customTextStyle;
  CustomTableCellItem({this.text, this.customTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: customTextStyle,
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
      child: Text('Sağlıklı Ye \nSağlıklı Yaşa',
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

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width, this.child})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final Widget child;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: child,
          ),
        ),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  Photo({Key key, this.photo, this.color, this.onTap}) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Material(
      // Slightly opaque color appears where the image has transparency.
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
          onTap: onTap,
          child: Image.asset(
            photo,
            fit: BoxFit.contain,
          )),
    );
  }
}
