import 'package:flutter/material.dart';

class InDetailEatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 110, right: 50, left: 50),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Bugün Tükettim',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 63),
          primary: Color(0xFFFA4A0C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
