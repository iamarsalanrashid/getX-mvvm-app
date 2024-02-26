import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practise/res/components/general_exception_widget.dart';
import 'package:getx_practise/res/components/internet_exception_widget.dart';
import 'package:getx_practise/view_models/controllers/home/home_view_model.dart';

import '../../data/response/status.dart';
import '../../res/routes/routes_names.dart';
import '../../view_models/controllers/user_preferences/user_preferences_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeViewModel = Get.put(HomeViewModel());
  final userPref = UserPreferencesViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( actions: [
        IconButton(
            onPressed: () {
              userPref.removeUser().then((value) {
                Get.toNamed(RoutesNames.loginScreen);
              });
            },
            icon: Icon(Icons.logout,color: Colors.black,))
      ],

        automaticallyImplyLeading: false,centerTitle: true  ,title: Text('Home Screen'),),
      body: Obx(() {
        switch (homeViewModel.rxResponseStatus.value) {
          case Status.Loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case Status.Error:
        if (homeViewModel.errorMessage.value == 'No Internet') {
          return Center(
              child: InternetExceptionWidget( handlePress: () {
                homeViewModel.refreshApi();
              },),
          );
        }
        else{
          return  Center(
            child: GeneralExceptionWidget( handlePress: () {
              homeViewModel.refreshApi();
            },),
          );
        }

          case Status.Completed:
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:  NetworkImage(homeViewModel
                          .userList.value.data![index].avatar as String),
                    ),
                    title: Text(homeViewModel
                        .userList.value.data![index].firstName as String),
                    subtitle: Text(homeViewModel
                        .userList.value.data![index].email as String),
                );
              },
              itemCount: homeViewModel.userList.value.data!.length,
            );
        }
        ;
      }),
    );
  }
}
