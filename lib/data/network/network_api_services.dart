import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_practise/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

import '../exceptions/app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    // if (kDebugMode) {
    //   print(url);
    // }
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions('');
    } on TimeoutException {
      throw TimeoutException('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 30));
      if (kDebugMode) {
        print(
            '${json.decode(response.body)}\n${response.statusCode}');
      }
       responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions('');
    } on TimeoutException {
      throw TimeoutException('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        print(response.statusCode);
        throw FetchDataExceptions('Status code : ${response.statusCode}');
    }
  }
}
