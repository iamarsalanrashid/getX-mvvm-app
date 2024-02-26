import 'package:get/get.dart';
import 'package:getx_practise/res/routes/routes_names.dart';
import 'package:getx_practise/view/home/home_screen.dart';
import 'package:getx_practise/view/login/login_screen.dart';
import 'package:getx_practise/view/splash_screen.dart';

class Routes {
  dynamic getRoutes() => [
        GetPage(
          name: RoutesNames.splashScreen,
          page: () => SplashScreen(),
          transition: Transition.zoom,
          transitionDuration: Duration(
            milliseconds: 500,
          ),
        ),
        GetPage(
          name: RoutesNames.loginScreen,
          page: () => LoginScreen(),
          transition: Transition.zoom,
          transitionDuration: Duration(
            milliseconds: 500,
          ),
        ),
    GetPage(
      name: RoutesNames.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.zoom,
      transitionDuration: Duration(
        milliseconds: 500,
      ),
    ),
      ];
}
