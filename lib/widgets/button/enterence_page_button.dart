import 'package:flutter/material.dart';

class Custom_enterence_page_button extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  Custom_enterence_page_button({
    this.buttonText,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          buttonText,
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFFA4A0C),
          minimumSize: Size(double.infinity, 63),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
      ),
    );
  }
}
