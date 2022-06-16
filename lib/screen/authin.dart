import 'package:animauth/core/const/constants.dart';
import 'package:animauth/core/widgets/label.dart';
import 'package:flutter/material.dart';

class AuthIn extends StatefulWidget {
  const AuthIn({Key? key}) : super(key: key);

  @override
  State<AuthIn> createState() => _AuthInState();
}

class _AuthInState extends State<AuthIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorConst.bgColor,
      body: const EyeWidget(),
    );
  }
}
