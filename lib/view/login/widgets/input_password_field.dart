import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controllers/login/login_view_model.dart';

class InputPasswordField extends StatelessWidget {
  const InputPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Get.put(LoginViewModel());

    return TextFormField(
      obscureText: true,
      controller: loginViewModel.passwordController.value,
      focusNode: loginViewModel.passwordFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          var message = 'Enter password';
          Get.snackbar('Error', message);
          return message;
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text('Password'),
        border: OutlineInputBorder(),
      ),
    );
  }
}
