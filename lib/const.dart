import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Demo splash'),
      ),
      body: Column(
        children: [
          CircularRevealAnimation(
            child: Center(
              child: FlutterLogo(
                size: 300,
              ),
            ),
            animation: animation!,
          ),
          MaterialButton(
            onPressed: () {
              if (animationController!.status == AnimationStatus.forward ||
                  animationController!.status == AnimationStatus.completed) {
                animationController!.reverse();
              } else {
                animationController!.forward();
              }
            },
            child: Text('Animate'),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
