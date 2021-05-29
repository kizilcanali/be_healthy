import 'package:flutter/material.dart';

class CustomLoginInputField extends StatelessWidget {
  String topic;
  bool isTextObscure;
  TextEditingController textValue;
  CustomLoginInputField({this.topic, this.isTextObscure, this.textValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              topic,
              style: TextStyle(
                  color: Color(0xFF919191), fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            controller: textValue,
            obscureText: isTextObscure,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
