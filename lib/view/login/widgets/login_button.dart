import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../res/components/rounded_corner_button.dart';
import '../../../view_models/controllers/login/login_view_model.dart';


class LoginButton extends StatelessWidget {
  final formKey;
  LoginButton({super.key,required this.formKey});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Get.put(LoginViewModel());

    return Obx(
          () => RoundedCornerButton(
          isLoading: loginViewModel.isLoading.value,
          title: 'login'.tr,
          width: 90,
          onPressed: () {
            formKey.currentState!.validate();
            loginViewModel.loginApi();
          }),
    );
  }
}
