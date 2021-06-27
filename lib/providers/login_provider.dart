import 'package:debtbook/providers/base_provider.dart';
import 'package:debtbook/utils/api_query.dart';
import 'package:debtbook/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends BaseProvider {
  late String phone;
  late String code = "";

  LoginProvider(BuildContext context) : super(context);

  void setPhone(String phone) {
    this.phone = phone;
    loadData();
  }

  void setCode(String code) {
    this.code = code;
    loadData();
  }

  @override
  Future<void> loadData() async {
    print(phone);
    print(code);
    startLoading();
    try {
      final Response response;
      if (code != "") {
        response = await ApiQuery.sendPhoneAndCode(phone, code);
      } else {
        response = await ApiQuery.sendPhone(phone);
      }
      if (response.statusCode == 201) {
        print('finishLoading: ${response.data}');
        finishLoading();
      } else {
        if (response.statusCode == 200) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', response.data['token'].toString());
          userToken = response.data['token'].toString();
          finishLoading();
        } else {
          if (response.data['detail'] != null){
            print(response.data['detail']);
            receivedError(response.data['detail']);
          } else receivedError(response.data);
        }
      }
    } catch (e) {
      print('BAG: $e');
      receivedError(e.toString());
    }
  }

  @override
  Future<void> refreshData(int arg) async {
    loadData();
  }
}