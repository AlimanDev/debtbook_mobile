import 'package:debtbook/providers/contacts_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  bool isDialog = false;

  late BuildContext mContext;

  @override
  void initState() {
    context.read<ContactsProvider>().initProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    ContactsProvider provider = ContactsProvider(context);
    provider.loadData();
    return Consumer<ContactsProvider>(
      builder: (context, model, child) {
        if (model.isLoaded && isDialog) {
          isDialog = false;
          model.initProvider();
          Future.delayed(Duration.zero, () async {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginPage(),
                ), (r) => false
            );
          });
        }
        if (model.loadingFailed && isDialog) {
          print('msg: ${model.errText}');
        }
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("wellcome"),
                SizedBox(height: 25),
                Container(),
                SizedBox(height: 25),
                Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}