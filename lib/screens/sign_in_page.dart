import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  Widget _logo() {
    return Text('Авторизация');
  }

  Widget _signInPageButton() {
    return FloatingActionButton(
        child: Text("Авторизация"),
        onPressed: () {}
    );
  }

  Widget _signUpPageButton() {
    return FloatingActionButton(
        child: Text("Регистрация"),
        onPressed: () {}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _logo(),
            SizedBox(height: 25,),
            _signInPageButton(),
            SizedBox(height: 25,),
            _signUpPageButton(),
          ],
        ),
      ),
    );
  }
}