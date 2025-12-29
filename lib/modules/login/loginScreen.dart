import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muri_client/shared/components/constants.dart';
import 'package:muri_client/shared/components/functions.dart';
import 'package:muri_client/shared/styles/colors.dart';
import '../../shared/components/Widgets/customButton.dart';
import '../../shared/components/Widgets/custom_textformfield.dart'
    hide AppColors;
import '../../shared/styles/backgroundClipper.dart';
import '../forgotpassword/forgotpasswordscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool isPasswordVisible = false;

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    child: Image.asset('assets/images/onback.png'),
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),

                  Text(
                    "مرحبًا بك من جديد",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.alexandria(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "سجّل دخولك لحجز مقعدك والاطلاع على جدول تنقلاتك اليومية.",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.alexandria(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- حقل البريد الإلكتروني ---
                  const SizedBox(height: 8),
                  CustomTextField(
                    label: 'البريد الإلكتروني',
                    hintText: 'برجاء إدخال البريد الإلكتروني',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 20),

                  // --- حقل كلمة المرور ---
                  const SizedBox(height: 8),
                  CustomTextField(
                    label: 'كلمة المرور',
                    hintText: 'برجاء إدخال كلمة المرور',
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),

                  // --- نسيت كلمة المرور ---
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        navigateTo(context, Forgotpasswordscreen());
                      },
                      child: Text(
                        "نسيت كلمة المرور ؟",
                        style: GoogleFonts.alexandria(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // --- زر تسجيل الدخول ---
                  SizedBox(
                    height: 55,
                    child: CustomButton(text: 'تسجيل الدخول', onPressed: () {}),
                  ),

                  const SizedBox(height: 25),

                  // --- ليس لديك حساب؟ ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // الانتقال لصفحة التسجيل
                        },
                        child: Text(
                          "إنشاء حساب",
                          style: GoogleFonts.alexandria(
                            color: AppColors.primaryBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "ليس لديك حساب؟",
                        style: GoogleFonts.alexandria(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
