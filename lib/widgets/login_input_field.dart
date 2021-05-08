import 'package:flutter/material.dart';

import 'custom_login_input_field.dart';

class LoginInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
