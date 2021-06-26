import 'package:debtbook/providers/base_provider.dart';
import 'package:debtbook/utils/api_query.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginProvider extends BaseProvider {
  late String phone;
  late String token;

  LoginProvider(BuildContext context) : super(context);

  void setPhone(String phone) {
    this.phone = phone;
    loadData();
  }

  @override
  Future<void> loadData() async {
    startLoading();
    try {
      final Response response = await ApiQuery.sendPhone(phone);
      if (response.statusCode == 201) {
        print('finishLoading: ${response.data}');
        finishLoading();
      } else {
        if (response.data['detail'] != null){
          print(response.data['detail']);
          receivedError(response.data['detail']);
        } else receivedError(response.data);
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