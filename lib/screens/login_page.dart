import 'package:debtbook/providers/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'code_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isDialog = false;
  late String phone;
  final controller = TextEditingController();

  late BuildContext mContext;

  @override
  void initState() {
    context.read<LoginProvider>().initProvider();
    super.initState();
  }

  Widget _logo() {
    return Text('Debt Book LOGO');
  }

  Widget _inputPhone() {
    return Center(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: "Номер телефона",
          prefixText: "+ 998 ",
          prefixIcon: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget _submitButton(model) {
    return ElevatedButton(child: Text("Отправить код"), onPressed: () {
      this.isDialog = true;
      model.setPhone("+998${controller.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Consumer<LoginProvider> (
      builder: (context, model, child) {
        if (model.isLoaded && isDialog) {
          isDialog = false;
          model.initProvider();
          Future.delayed(Duration.zero, () async {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => sendCodePage(),
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
                _logo(),
                SizedBox(height: 25),
                _inputPhone(),
                SizedBox(height: 25),
                _submitButton(model),
              ],
            ),
          ),
        );
      }
    );
  }
}
