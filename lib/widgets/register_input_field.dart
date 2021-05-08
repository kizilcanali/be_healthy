import 'package:flutter/material.dart';

import 'custom_login_input_field.dart';

class RegisterInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLoginInputField(
          topic: 'İsim',
          isTextObscure: false,
        ),
        CustomLoginInputField(
          topic: 'Mail Adresi',
          isTextObscure: false,
        ),
        CustomLoginInputField(
          topic: 'Şifre',
          isTextObscure: false,
        ),
      ],
    );
  }
}
