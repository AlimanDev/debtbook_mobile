import 'package:debtbook/screens/code_page.dart';
import 'package:debtbook/screens/error_page.dart';
import 'package:debtbook/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const login = '/';
  static const sendCode = '/sendCode';
  static const signUp = '/signUpPage';
  static const contacts = '/contactsPage';
  static const payments = '/paymentsPage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      // final Object? args = routeSettings.arguments;

      switch (routeSettings.name) {
        case login:
          return MaterialPageRoute(
              builder: (_) => LoginPage(), settings: routeSettings
          );
        case sendCode:
          return MaterialPageRoute(
              builder: (_) => sendCodePage(), settings: routeSettings
          );
        default:
          return errorRoute(routeSettings);
      }
    } catch (_) {
      return errorRoute(routeSettings);
    }
  }

  static Route<dynamic> errorRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (_) => ErrorPage(), settings: routeSettings);
  }
}