import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
