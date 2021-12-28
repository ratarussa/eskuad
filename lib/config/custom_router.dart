import 'package:eskuad/config/strings.dart';
import 'package:eskuad/screens/screens.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ArticleScreen.routeName:
        return ArticleScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(StringManager.errorTitle)),
        body: const Center(child: Text(StringManager.errorBody)),
      ),
    );
  }
}
