import 'package:be_healthy/Services/authentication_service.dart';
import 'package:be_healthy/Widgets/button/enterence_page_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'custom_login_input_field.dart';

class RegisterInputs extends StatelessWidget {
  AuthenticationService authService =
      AuthenticationService(FirebaseAuth.instance);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLoginInputField(
          topic: 'İsim',
          isTextObscure: false,
          textValue: name,
        ),
        SizedBox(
          height: 20,
        ),
        CustomLoginInputField(
          topic: 'Mail Adresi',
          isTextObscure: false,
          textValue: email,
        ),
        SizedBox(
          height: 20,
        ),
        CustomLoginInputField(
          topic: 'Şifre',
          isTextObscure: false,
          textValue: password,
        ),
        SizedBox(
          height: 40,
        ),
        custom_enterence_page_button(
          buttonText: 'Kayıt Ol',
          onPress: () {
            print("${email.text} ${password.text}, ${name.text}");
            authService.signUp(email.text.trim(), password.text.trim(),
                name.text.trim(), context);
          },
        ),
      ],
    );
  }
}
