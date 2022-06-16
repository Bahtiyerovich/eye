import 'package:animauth/core/const/constants.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight? fontWeight = WeightConst.kNormalWeight;
  TextAlign? textAlign = TextAlign.center;

  MyText({
    Key? key,
    this.color = const Color(0xFF6A6975),
    required this.text,
    this.size = 0,
    this.height = 1.2,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color,
        fontFamily: 'HKGrotesk',
        fontSize: size == 0 ? FontConst.kSmallFont : size,
        fontWeight: fontWeight,
      ),
    );
  }
}
