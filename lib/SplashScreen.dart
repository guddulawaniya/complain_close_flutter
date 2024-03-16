import 'dart:async';

import 'package:complain_close_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splash_screenState();
}
class _splash_screenState extends State<splashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 1800), () {
      FlutterSplashScreen.hide();
    });
  }

  @override
  void initState() {
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..repeat(reverse: false);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    hideScreen();

    Timer(
        Duration(seconds: 3), () => Navigator.pushReplacement(context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: loginpage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.lightBlue,
                  Colors.white
                ]

            )
        ),
        child: ScaleTransition(
          scale: animation,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_3_outlined , size: 50, )
                // Image.asset(Icons.person_2_outlined as String,height: 100,width: 100,)

              ],
            ),
          ),
        ),


      ),

    );
  }
}
