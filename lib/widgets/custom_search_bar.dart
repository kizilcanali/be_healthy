import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Search Bar
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(top: 20),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFEFEEEE),
          hintText: 'Yemek Ara',
          hintStyle: TextStyle(
            color: Color(0xFF787777),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
