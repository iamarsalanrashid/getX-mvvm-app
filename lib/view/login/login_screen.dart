import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practise/res/routes/routes_names.dart';
import 'package:getx_practise/view/login/widgets/input_email_field.dart';
import 'package:getx_practise/view/login/widgets/input_password_field.dart';
import 'package:getx_practise/view/login/widgets/login_button.dart';
import 'package:getx_practise/view_models/controllers/login/login_view_model.dart';
import 'package:getx_practise/view_models/controllers/user_preferences/user_preferences_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Get.put(LoginViewModel());

    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('login'.tr),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        physics: BouncingScrollPhysics(),
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputEmailField(),
                  SizedBox(
                    height: 20,
                  ),
                  InputPasswordField(),
                  SizedBox(
                    height: 30,
                  ),
                  LoginButton(
                    formKey: formKey,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
