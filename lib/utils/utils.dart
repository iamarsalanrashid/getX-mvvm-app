import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../res/colors/app_colors.dart';

class Utils {

  static void changeFieldFocus(BuildContext context, FocusNode currentFocus,
      FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static showToastMessage( String message) {
    Fluttertoast.showToast(
        msg: message,);
  }

  static showSnackBar(String title,String message) {
    Get.snackbar(title, message);
  }


}