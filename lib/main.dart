import 'package:debtbook/providers/login_provider.dart';
import 'package:debtbook/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider(context)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Debt Book",
        onGenerateRoute: Routes.generateRoute,
        onUnknownRoute: Routes.errorRoute,
      ),
    );
  }
}