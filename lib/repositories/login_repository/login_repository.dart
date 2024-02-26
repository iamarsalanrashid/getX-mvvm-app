

import 'package:getx_practise/data/network/network_api_services.dart';
import 'package:getx_practise/res/urls/app_urls.dart';

class LoginRepository {

  final _networkApi = NetworkApiServices();
  // final endpoints = AppUrls();

Future<dynamic> loginApi (var data) async {
  final response  = await _networkApi.postApi(data, AppUrls.postEndpoint);
  return response;
}


}