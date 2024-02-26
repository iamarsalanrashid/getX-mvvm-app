import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controllers/login/login_view_model.dart';


class InputEmailField extends StatelessWidget {
  const InputEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Get.put(LoginViewModel());

    return  TextFormField(
      controller: loginViewModel.emailController.value,
      focusNode: loginViewModel.emailFocusNode.value,
      onFieldSubmitted: (value) {
        Utils.changeFieldFocus(
          context,
          loginViewModel.emailFocusNode.value,
          loginViewModel.passwordFocusNode.value,
        );
      },
      validator: (value) {
        if (value!.isEmpty) {
          var message = 'Enter Email';
          Get.snackbar('Error', message);

          Utils.showToastMessage(message);
          return message;
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text('Email'),
        border: OutlineInputBorder(),
      ),
    );
  }
}
