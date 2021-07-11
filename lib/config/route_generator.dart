import 'package:flutter/material.dart';
import 'package:starterz/screen/auth/page/auth_page.dart';
import 'package:starterz/screen/main/page/main_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'auth':
        return MaterialPageRoute(builder: (context) => AuthPage());
      case 'main':
        return MaterialPageRoute(builder: (context) => MainPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          centerTitle: true,
        ),
        body: Center(
          child: const Text('Something Bad Happened'),
        ),
      ),
    );
  }
}
