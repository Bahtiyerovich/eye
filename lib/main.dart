
import 'package:animauth/core/compo/theme.dart';
import 'package:animauth/core/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeComp.materialTheme,
      onGenerateRoute: Routes.instantce.onGeneralRoute,
      initialRoute: '/authin',
    );
  }
}
