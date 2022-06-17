import 'package:animauth/core/compo/input_comp.dart';
import 'package:animauth/core/const/constants.dart';
import 'package:animauth/core/extention/context.dart';
import 'package:animauth/core/widgets/mytext.dart';
import 'package:flutter/material.dart';


class EyeWidget extends StatefulWidget {
  const EyeWidget({Key? key}) : super(key: key);

  @override
  State<EyeWidget> createState() => _EyeWidgetState();
}

class _EyeWidgetState extends State<EyeWidget> with TickerProviderStateMixin {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool isHidden = false;

  AnimationController? animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      // lowerBound: 101,
      // upperBound: 145,
      lowerBound: 123,
      upperBound: 123.1,
      duration: const Duration(microseconds: 1),
    );

    animationController!.forward();

    animationController!.addListener(() {
      setState(() {});
    });

    animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController!.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.h * 0.43,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: context.h * 0.16),
                      child: CustomPaint(
                        size: const Size(400, 400),
                        painter: ArcPainter(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: animationController!.value,
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
                decoration: InputComp.inputDecoration(hintText: "Login"),
                cursorColor: Colors.white,
                onTap: pastkaQarash,
                validator: (t) {
                  if (t!.length != 19) {
                    return "Number  must be +998(XX) XXX-XX-XX !";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(context.h * 0.025),
              child: TextFormField(
                obscureText: !isHidden,
                controller: _passController,
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
                onTap: tepagaQarash,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: context.w * 0.16),
              child: Row(
                children: [
                  MyText(
                    text: 'Forgot?',
                    size: FontConst.kMediumFont,
                    color: Colors.black,
                  ),
                  SizedBox(width: context.w * 0.15),
                  MyText(
                    text: 'SignUp',
                    size: FontConst.kMediumFont,
                    color: Colors.black,
                  ),
                  SizedBox(width: context.w * 0.15),
                  ElevatedButton(
                    child: MyText(text: 'Login'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  tepagaQarash() {
    setState(() {
      if (animationController!.value <= 102) {
        animationController!.dispose();
      } else {
        animationController = AnimationController(
          vsync: this,
          lowerBound: 101,
          upperBound: animationController!.value,
          duration: const Duration(milliseconds: 500),
        );
        animationController!.forward();
        animationController!.addListener(() {
          setState(() {});
        });
        animationController!.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            animationController!.reverse();
          }
        });
      }
    });
  }

  pastkaQarash() {
    setState(() {
      if (animationController!.value == 145) {
        animationController!.dispose();
      } else {
        animationController = AnimationController(
          vsync: this,
          lowerBound: animationController!.value,
          upperBound: 145,
          duration: const Duration(milliseconds: 500),
        );
        animationController!.forward();
        animationController!.addListener(() {
          setState(() {});
        });
        animationController!.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            setState(() {});
          }
        });
      }
    });
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
// animationController!.repeat();
// animationController!.reset();
// animationController!.reverse();
// animationController!.forward();


