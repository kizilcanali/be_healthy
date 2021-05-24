import 'package:be_healthy/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProfilePageInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(
            left: 100,
            right: 100,
            bottom: 90,
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://source.unsplash.com/random?people'),
              radius: 60,
            ),
          ),
          Positioned(
            left: 60,
            top: 130,
            child: Column(
              children: [
                Text('PUŞT BURAK',
                    style:
                        GoogleFonts.notoSans(textStyle: kProfileInfoTextStyle)),
                Text(
                  'burkclik@gmail.com',
                  style: GoogleFonts.notoSans(textStyle: kProfileInfoTextStyle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
