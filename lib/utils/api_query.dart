import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'api_urls.dart';

class ApiQuery {

  static Future<Response> sendPhone(String phone) async {
    FormData formData = FormData.fromMap({"phone": phone});
    return Dio().post(Url.login, data: formData);
  }

  static Future<Response> sendPhoneAndCode(String phone, String code) {
    FormData formData = FormData.fromMap({"phone": phone, "code": code});
    return Dio().post(Url.login, data: formData);
  }
}