//import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => MainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/tech_splash.png",
                height: 64,
              ),
              const SizedBox(
                height: 32,
              ),
              const SpinKitFadingCube(
                color: SolidColors.primeryColor,
                size: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
