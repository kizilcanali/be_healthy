import 'package:be_healthy/Utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomSmokePageTopContainer extends StatelessWidget {
  const CustomSmokePageTopContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: Color(0xFF242C38),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Icon(
            Icons.smoke_free,
            color: Color(0xFFFA4A0C),
            size: 92,
          ),
          Text(
            "3g 16s 37d 23sn",
            style: TextStyle(
              color: Color(0xFFFA4A0C),
              fontSize: 48,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "25",
                    style: kSmokePageParameterStyleNumeric,
                  ),
                  Text(
                    "Sigara İçilmedi",
                    style: kSmokePageParameterStyleText,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "20TL",
                    style: kSmokePageParameterStyleNumeric,
                  ),
                  Text(
                    "Kurtarıldı",
                    style: kSmokePageParameterStyleText,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
