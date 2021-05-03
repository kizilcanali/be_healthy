import 'package:be_healthy/widgets/photo_hero.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_detail/food_detail_page.dart';

class FoodCard extends StatelessWidget {
  FoodCard({this.meal, this.index});
  dynamic meal;
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20,
      ),
      child: InkWell(
        onTap: () {},
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
                    meal[index]["name"],
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    meal[index]["calorie"].toString() + ' kcal',
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
                photo: 'tag{$index}',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return FoodDetail(
                          meal: meal,
                          index: index,
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
