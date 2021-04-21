import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF2F2F2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 350,
              //margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Color(0xFFFFFFFF)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 90),
                    child: Image.asset(
                      'images/logo.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign-up',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            /*SizedBox(
              height: 50,
            ),*/
            Column(
              children: [
                CustomLoginInputField(
                  topic: 'EmailAdress',
                  isTextObscure: false,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomLoginInputField(
                  topic: 'Password',
                  isTextObscure: true,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 40),
                  child: TextButton(
                    child: Text(
                      'Forgot passcode?',
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
                onPressed: () {},
                child: Text(
                  'Login',
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
