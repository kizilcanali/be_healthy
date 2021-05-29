import 'package:flutter/material.dart';

class CustomProfileParameterEditCard extends StatelessWidget {
  TextEditingController textValue;
  String topic;

  CustomProfileParameterEditCard({this.textValue, this.topic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 80),
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(
            top: 40,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: TextField(
                controller: textValue,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 100,
            child: Text(
              topic,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            top: 63,
            left: 290,
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
