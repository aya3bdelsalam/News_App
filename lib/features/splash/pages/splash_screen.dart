import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/config/page_route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, PageRouteNames.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
         alignment: Alignment.center,
         children: [
           Image.asset("assets/images/splash.png"),
           Image.asset("assets/images/logo.png")
         ],
       ),
    );
  }
}
