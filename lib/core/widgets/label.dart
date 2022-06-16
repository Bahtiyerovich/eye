import 'dart:convert';

import 'package:animauth/core/const/constants.dart';
import 'package:animauth/core/extention/context.dart';
import 'package:flutter/material.dart';

class EyeWidget extends StatefulWidget {
  const EyeWidget({Key? key}) : super(key: key);

  @override
  State<EyeWidget> createState() => _EyeWidgetState();
}

class _EyeWidgetState extends State<EyeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.bgColor,
      body: Stack(children: [
        Positioned(
          top: context.h * 0.1,
          child: CustomPaint(
            size: const Size(400, 400),
            painter: ArcPainter(),

            // child: Container(
          ),
        ),
        Positioned(
          top: context.h * 0.12,
          left: context.w * 0.35,
          child: CircleAvatar(
            backgroundColor: Colors.black87,
            radius: 60,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 50,
            ),
          ),
        ),
        Positioned(
          top: context.h * 0.25,
          left: context.w * 0.13,
          child: CustomPaint(
            size: const Size(300, 300),
            painter: SmilePainter(),

            // child: Container(
          ),
        ),
      ]),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final arc1 = Path();
    arc1.moveTo(size.width * 0.2, size.height * 0.2);
    arc1.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.2),
      radius: const Radius.circular(129),
    );

    canvas.drawPath(arc1, paint);

    canvas.drawPath(arc1, paint);

    final arc2 = Path();
    arc2.moveTo(size.width * 0.2, size.height * 0.2);
    arc2.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.2),
      radius: const Radius.circular(129),
      clockwise: false,
    );
    canvas.drawPath(arc2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SmilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final arc1 = Path();
    canvas.drawPath(arc1, paint);

    arc1.moveTo(size.width * 0.2, size.height * 0.2);
    arc1.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.2),
      radius: const Radius.circular(160),
      clockwise: false,
    );
    canvas.drawPath(arc1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
