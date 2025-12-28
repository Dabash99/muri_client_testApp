import 'package:flutter/material.dart';

import '../../shared/components/Widgets/backarrowbox.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/backgroundClipper.dart';
import '../../shared/styles/colors.dart';

class Forgotpasswordscreen extends StatelessWidget {
  const Forgotpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: BackgroundClipper(),
                  child: Container(

                    height: 317,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Column(
                    children: [
                      Image.asset(kLogo, height: 106),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
