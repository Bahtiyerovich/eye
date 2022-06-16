import 'package:animauth/screen/authin.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Routes _instance = Routes.init();
  static Routes get instantce => _instance;
  Routes.init();
  Route? onGeneralRoute(RouteSettings set) {
    var args = set.arguments;
    switch (set.name) {
      case '/authin':
        return MaterialPageRoute(builder: (context) => const AuthIn());
    }
  }
}
