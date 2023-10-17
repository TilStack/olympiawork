import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:olympiawork/homePage.dart';

class SplashEssai extends StatefulWidget {
  SplashEssai({super.key});

  @override
  State<SplashEssai> createState() => _SplashEssaiState();
}

class _SplashEssaiState extends State<SplashEssai>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    );
    animationController!.forward();

    animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    });
//  if (animationController!.status == AnimationStatus.forward ||
//                   animationController!.status == AnimationStatus.completed) {
//                 animationController!.reverse();
//               } else {
//                 animationController!.forward();
//               }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CircularRevealAnimation(
        animation: animation!,
        child: Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Image.asset(
                "assets/images/olymp.png",
              ),
            ),),
      ),
    );
  }
}
