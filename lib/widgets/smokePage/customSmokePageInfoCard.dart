import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class customSmokePageInfoCard extends StatelessWidget {
  const customSmokePageInfoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 30),
      decoration: BoxDecoration(
        color: Color(0x80C4C4C4),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 50,
            lineWidth: 5,
            animation: true,
            percent: 0.5, //will change
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Color(0xFF242C38),
            backgroundColor: Color(0x80FA4A0C),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "Kan Basıncı Normale Döndü",
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
