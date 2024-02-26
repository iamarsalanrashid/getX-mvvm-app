import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:getx_practise/data/exceptions/app_exceptions.dart';
import 'package:http/http.dart' as http;

abstract class BaseApiServices {

  Future<dynamic> getApi(String url) ;
  Future<dynamic> postApi(dynamic data, String url) ;

}
