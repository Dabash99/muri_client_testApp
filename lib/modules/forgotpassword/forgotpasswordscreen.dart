import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muri_client/modules/login/loginScreen.dart';
import 'package:muri_client/shared/components/Widgets/customButton.dart';
import 'package:muri_client/shared/components/functions.dart';

import '../../shared/components/Widgets/backarrowbox.dart';
import '../../shared/components/Widgets/custom_textformfield.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/backgroundClipper.dart';
import '../../shared/styles/colors.dart';

class Forgotpasswordscreen extends StatelessWidget {
  Forgotpasswordscreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      body: Column(
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
                  ],
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: BackArrowBox(onPressed: () => Navigator.pop(context)),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "استعادة كلمة المرور",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.alexandria(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "من فضلك، أدخل بريدك الإلكتروني لاستعادة كلمة المرور",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.alexandria(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hintText: 'ادخل حسابك ',
                    label: 'البريد الإلكتروني',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Column(
              children: [
                CustomButton(
                  text: "إستعادة كلمة المرور",
                  onPressed: () {

                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                       navigateAndFinish(context, Loginscreen());
                      },
                      child: Text(
                        "تسجيل الدخول",
                        style: GoogleFonts.alexandria(
                          color: AppColors.primaryBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "تذكرت كلمة المرور؟",
                      style: GoogleFonts.alexandria(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}