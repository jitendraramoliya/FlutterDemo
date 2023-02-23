import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          // const MyHomePage(title: 'Flutter Demo Home Page')
                          const Login())));
        }
      });
    curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) =>
    //                 // const MyHomePage(title: 'Flutter Demo Home Page')
    //                 const Login())));
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return Container(
      color: Colors.blueAccent,
      // child: Center(
      //     child: FlutterLogo(
      //   size: 100,
      // )),
      child: Center(
        child: FadeTransition(
          opacity: curve,
          child: const FlutterLogo(
            size: 100.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
