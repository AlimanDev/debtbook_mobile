import 'package:debtbook/providers/base_provider.dart';
import 'package:debtbook/utils/api_query.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ContactsProvider extends BaseProvider {
  ContactsProvider(BuildContext context) : super(context);

  void getData() {
    loadData();
  }

  @override
  Future<void> loadData() async {
    print('start');
    startLoading();
    try {
      final Response response;
      print('response');
      response = await ApiQuery.getContacts();
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        finishLoading();
      } else {
        if (response.data['detail'] != null){
          print(response.data['detail']);
          receivedError(response.data['detail']);
        } else receivedError(response.data);
      }
    } catch (e) {
      receivedError(e.toString());
    }
  }

  @override
  Future<void> refreshData(int arg) async {
    loadData();
  }
}