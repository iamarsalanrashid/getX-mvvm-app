import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practise/res/localization/languages.dart';
import 'package:getx_practise/res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale('en', 'US'),
      translations: Languages(),
      fallbackLocale: Locale('en', 'US'),
      //main language
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomeScreen(),
      getPages: Routes().getRoutes(),
    );
  }
}
