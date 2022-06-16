import 'package:animauth/core/compo/input_comp.dart';
import 'package:animauth/core/const/constants.dart';
import 'package:animauth/core/extention/context.dart';
import 'package:flutter/material.dart';

class EyeWidget extends StatefulWidget {
  const EyeWidget({Key? key}) : super(key: key);

  @override
  State<EyeWidget> createState() => _EyeWidgetState();
}

class _EyeWidgetState extends State<EyeWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController =
      TextEditingController(text: '+998 ');
  final TextEditingController _confirmController = TextEditingController();

  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.bgColor,
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: context.h * 0.43,
          child: Stack(
            children: [
              Positioned(
                top: context.h * 0.1,
                child: CustomPaint(
                  size: const Size(400, 400),
                  painter: ArcPainter(),
                ),
              ),
              Positioned(
                top: context.h * 0.12,
                left: context.w * 0.35,
                child: const CircleAvatar(
                  backgroundColor: Colors.black87,
                  radius: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 45,
                  ),
                ),
              ),
              Positioned(
                top: context.h * 0.25,
                left: context.w * 0.13,
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: SmilePainter(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(context.h * 0.025),
          child: TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.number,
            decoration: InputComp.inputDecoration(),
            cursorColor: Colors.white,
            validator: (text) {
              if (text!.length != 19) {
                return "Number  must be +998(XX) XXX-XX-XX !";
              }
              return null;
            },
          ),
        ),
        // const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(context.h * 0.025),
          child: TextFormField(
            obscureText: !isHidden,
            controller: _confirmController,
            cursorColor: Colors.white,
            decoration: InputComp.inputDecoration(
              hintText: "Password",
              suffixIcon: IconButton(
                splashRadius: 20.0,
                icon: Icon(isHidden
                    ? Icons.remove_red_eye_rounded
                    : Icons.remove_red_eye_outlined),
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ])),
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
