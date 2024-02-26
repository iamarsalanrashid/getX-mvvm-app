import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/login/user_model.dart';

class UserPreferencesViewModel {

  Future<bool> saveUser(UserModel userModel) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString('token', userModel.token.toString());
    return true;
  }//save user in shared preferences

  Future<UserModel> getUser() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final userData = sharedPref.getString('token');
    // UserModel.fromJson({'token': userData});
    return UserModel(token: userData);
  }

  Future<bool> removeUser() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();
    return true;
  }
}
