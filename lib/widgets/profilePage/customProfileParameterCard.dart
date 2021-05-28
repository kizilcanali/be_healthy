import 'package:flutter/material.dart';

class CustomProfileParameterEditCard extends StatelessWidget {
  const CustomProfileParameterEditCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(
            top: 25,
            left: 70,
            child: Column(
              children: [
                Text(
                  'Günlük Kalori Hedefi',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Girdiği Miktar',
                  style: TextStyle(fontSize: 17),
                ), //Bu değişecek
              ],
            ),
          ),
          Positioned(
            top: 25,
            left: 290,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
