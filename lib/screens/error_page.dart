import 'package:big_tip/big_tip.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BigTip(
        title: Text('Произошло ошибка!'),
        subtitle: Text('Такой страницы не существует'),
        action: Text('НАЗАД'),
        actionCallback: () => Navigator.pop(context),
        child: Icon(Icons.error_outline),
      ),
    );
  }
}