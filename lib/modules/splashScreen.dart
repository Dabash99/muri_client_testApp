import 'dart:async';
import 'package:flutter/material.dart';
import 'package:muri_client/modules/onboarding.dart';
import 'package:muri_client/shared/styles/colors.dart';

import '../shared/components/constants.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500,
      body: Stack(
        children: [
          Positioned(
            child: Image.asset('assets/images/Fadelogo.png'),
            height: 325,
            left: 41,
            top: 618,
          ),
          Center(child: Image.asset(kLogo, height: 146)),
        ],
      ),
    );
  }
}
