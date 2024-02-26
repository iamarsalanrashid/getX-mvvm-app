import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practise/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    _splashServices.islogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(    backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text('splashtitle'.tr),
      ),
      body: Center(
        child: Text(
          'Welome',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
