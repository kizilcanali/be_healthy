import 'package:be_healthy/Widgets/login_register/custom_login_input_field.dart';
import 'package:be_healthy/Widgets/login_register/login_input_field.dart';
import 'package:be_healthy/Widgets/login_register/register_input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xFFF2F2F2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Color(0xFFFFFFFF)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 55),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 320,
                      height: 190,
                    ),
                  ),
                  DefaultTabController(
                    length: 2,
                    child: TabBar(
                      labelStyle: TextStyle(fontSize: 18),
                      isScrollable: true,
                      labelColor: Color(0xFFFA4A0C),
                      unselectedLabelColor: Color(0XFF9A9A9D),
                      indicatorColor: Color(0xFFFA4A0C),
                      indicatorWeight: 3,
                      onTap: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      tabs: [
                        Tab(
                          text: 'Giriş Yap',
                        ),
                        Tab(
                          text: 'Üye Ol',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            currentIndex == 0
                ? LoginInputs()
                : RegisterInputs(), //lastly here not tested
          ],
        ),
      ),
    );
  }
}
