import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_practise/models/login/user_model.dart';
import 'package:getx_practise/repositories/login_repository/login_repository.dart';
import 'package:getx_practise/res/routes/routes_names.dart';
import 'package:getx_practise/utils/utils.dart';
import 'package:getx_practise/view_models/controllers/user_preferences/user_preferences_view_model.dart';

class LoginViewModel extends GetxController {
  final _loginRepository = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool isLoading = false.obs;

  void loginApi() {
    UserPreferencesViewModel userSharedPref = UserPreferencesViewModel();
    isLoading.value = true;
    Map data = {
      'email': emailController.value.text.trim(),
      'password': passwordController.value.text.trim()
    };

    _loginRepository.loginApi(data).then((value) {
      isLoading.value = false;
      if (value['error'] == 'Missing email or username') {
        Utils.showSnackBar('Error', 'Missing email or username');
      } else {
        Utils.showSnackBar('Login', 'Login Successfull');

        userSharedPref.saveUser(UserModel.fromJson(value)).then((value) {
          Get.delete<LoginViewModel>();
          Get.toNamed(RoutesNames.homeScreen);
        },).onError((error, stackTrace) {
          print('error in saving user in sharedPref: ${error.toString()}');
        },);
      }
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Utils.showSnackBar('Error', error.toString());
      },
    );
  }
}
