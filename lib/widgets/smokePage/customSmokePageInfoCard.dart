import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomSmokePageInfoCard extends StatelessWidget {
  final String appearingHour, description;

  CustomSmokePageInfoCard(this.appearingHour, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 30),
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
            width: 10,
          ),
          Flexible(
            child: Text(
              "$appearingHour $description",
              style: GoogleFonts.notoSans(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
