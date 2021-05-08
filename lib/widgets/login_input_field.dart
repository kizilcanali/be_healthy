import 'package:be_healthy/Services/authentication_service.dart';
import 'package:be_healthy/Widgets/button/enterence_page_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'custom_login_input_field.dart';

class LoginInputs extends StatelessWidget {
  AuthenticationService authService =
      AuthenticationService(FirebaseAuth.instance);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLoginInputField(
          topic: 'Mail Adresi',
          isTextObscure: false,
          textValue: email,
        ),
        SizedBox(
          height: 40,
        ),
        CustomLoginInputField(
          topic: 'Şifre',
          isTextObscure: true,
          textValue: password,
        ),
        custom_enterence_page_button(
            buttonText: "Giriş Yap",
            onPress: () {
              authService.signedIn(
                  email.text.trim(), password.text.trim(), context);
            }),
      ],
    );
  }
}
