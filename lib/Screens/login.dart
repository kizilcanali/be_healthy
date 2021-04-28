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
              height: 350,
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
                    margin: EdgeInsets.only(top: 90),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 280,
                      height: 150,
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
            Column(
              children: [
                CustomLoginInputField(
                  topic: 'Mail Adresi',
                  isTextObscure: false,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomLoginInputField(
                  topic: 'Şifre',
                  isTextObscure: true,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 40),
                  child: TextButton(
                    child: Text(
                      'Şifreni mi unuttun?',
                      style: TextStyle(
                        color: Color(0xFFFA4A0C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == 0) {
                    //make login operation
                  } else {
                    //do signup operation
                  }
                },
                child: Text(
                  currentIndex == 0 ? 'Login' : 'Register',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFA4A0C),
                  minimumSize: Size(double.infinity, 63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLoginInputField extends StatelessWidget {
  String topic;
  bool isTextObscure;
  CustomLoginInputField({this.topic, this.isTextObscure});
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
            obscureText: isTextObscure,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
