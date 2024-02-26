

import 'package:getx_practise/data/network/network_api_services.dart';
import 'package:getx_practise/models/home/user_list_model.dart';
import 'package:getx_practise/res/urls/app_urls.dart';

class HomeRepository {

  final _networkApi = NetworkApiServices();
  Future<UserListModel> userListModel () async {
    final response  = await _networkApi.getApi(AppUrls.userListApi);
    return UserListModel.fromJson(response);
  }


}