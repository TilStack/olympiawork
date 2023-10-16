import 'package:flutter/material.dart';
import 'package:olympiawork/homePage.dart';

import 'const.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Temps défini pour l'animation
    );

    _controller!.forward(); // Lance l'animation

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // L'animation est terminée, navigue vers une autre page ou effectue d'autres actions ici
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) {
            final double value = _controller!.value;
            final isCircle =
                value < 0.5; // Cercle pendant la première moitié de l'animation
            final isRectangle =
                value >= 0.5; // Rectangle pendant la deuxième moitié

            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.red, // Couleur du fond rouge
              child: Center(
                child: ClipOval(
                  clipper: isCircle ? MyClipper(value * 2) : null,
                  child: ClipRect(
                    clipper: isRectangle ? MyClipper((value - 0.5) * 2) : null,
                    child: Image.asset("assets/images/olymp.png"),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}

class MyClipper extends CustomClipper<Rect> {
  final double animationValue;

  MyClipper(this.animationValue);

  @override
  Rect getClip(Size size) {
    final double width = size.width * animationValue;
    final double height = size.height;
    final double left = (size.width - width) / 2;

    return Rect.fromLTWH(left, 0, width, height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
