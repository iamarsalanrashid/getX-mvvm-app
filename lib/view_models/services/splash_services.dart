import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_practise/res/routes/routes_names.dart';
import 'package:getx_practise/view_models/controllers/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  UserPreferencesViewModel userPref = UserPreferencesViewModel();

  void islogin() {
    userPref.getUser().then((value) {
      print(value.token.toString());
      if (value.token.toString().isEmpty || value.token.toString() == 'null') {
        Timer(Duration(seconds: 3), () {
          Get.toNamed(RoutesNames.loginScreen);
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Get.toNamed(RoutesNames.homeScreen);
        });
      }
    }).onError((error, stackTrace) {
      print('error in the splashservices${error.toString()}');
    });
  }
}
