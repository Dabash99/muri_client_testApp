import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muri_client/shared/components/constants.dart';
import 'package:muri_client/shared/styles/colors.dart';
// تأكد من مسار الكليبر الصحيح
import '../../shared/styles/backgroundClipper.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  // للتحكم في إظهار وإخفاء كلمة المرور
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
            // ==========================================
            // 1. الهيدر (الخلفية الزرقاء + اللوجو)
            // ==========================================
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: BackgroundClipper(),
                  child: Container(
                    height: 300, // ارتفاع الهيدر
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
                      Image.asset(
                        kLogo,
                        height: 80,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),

            // ==========================================
            // 2. محتوى الفورم (Form)
            // ==========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // لجعل العناصر تأخذ العرض كامل
                children: [
                  const SizedBox(height: 20),

                  // العنوان والوصف
                  Text(
                    "مرحبًا بك من جديد",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alexandria(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "سجّل دخولك لحجز مقعدك والاطلاع على جدول تنقلاتك اليومية.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alexandria(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- حقل البريد الإلكتروني ---
                  _buildLabel("البريد الإلكتروني"),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: _inputDecoration(hint: "برجاء إدخال البريد الإلكتروني"),
                  ),

                  const SizedBox(height: 20),

                  // --- حقل كلمة المرور ---
                  _buildLabel("كلمة المرور"),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible, // التحكم في الإخفاء
                    decoration: _inputDecoration(
                      hint: "برجاء إدخال كلمة المرور",
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  // --- نسيت كلمة المرور ---
                  Align(
                    alignment: Alignment.centerRight, // محاذاة لليمين (بداية السطر بالعربي)
                    child: TextButton(
                      onPressed: () {
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
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "تسجيل الدخول",
                        style: GoogleFonts.alexandria(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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

  // ودجت مساعد لعنوان الحقل
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.alexandria(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  // ودجت مساعد لتنسيق الحقول
  InputDecoration _inputDecoration({required String hint, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.alexandria(color: Colors.grey[400], fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryBlue),
      ),
    );
  }
}