import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:muri_client/shared/styles/text.dart';
import 'package:muri_client/shared/components/constants.dart';
import 'package:muri_client/shared/components/functions.dart';
import 'package:muri_client/shared/styles/colors.dart';
import '../../shared/components/Widgets/customButton.dart';
import '../../shared/components/Widgets/custom_textformfield.dart';
import '../../shared/styles/backgroundClipper.dart';
import '../forgotpassword/forgotpasswordscreen.dart';
import '../registerscreen/register_screen.dart';
// تأكد من استدعاء ملفات الـ Cubit والـ States
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class Loginscreen extends StatelessWidget {
  // حولناها لـ StatelessWidget لأننا هنستخدم Cubit
  Loginscreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            print("Login Success: ${state.model}");
          }
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                              color: AppColors.primary500,
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
                          TextBoldBodyLarge(label: "مرحبًا بك من جديد",color: AppColors.textColorPrimary,),
                          const SizedBox(height: 8),
                          TextRegularLabel(label: "سجّل دخولك لحجز مقعدك والاطلاع على جدول تنقلاتك اليومية.",color: AppColors.textColorDisable),

                          const SizedBox(height: 30),

                          CustomTextField(
                            label: 'البريد الإلكتروني',
                            hintText: 'برجاء إدخال البريد الإلكتروني',
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 20),

                          // --- حقل كلمة المرور ---
                          CustomTextField(
                            label: 'كلمة المرور',
                            hintText: 'برجاء إدخال كلمة المرور',
                            controller: passwordController,
                            obscureText: cubit.isPassword,
                            prefixIcon: IconButton(
                              onPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              icon:  Icon(
                                cubit.isPassword? IconsaxPlusLinear.eye
                                    : IconsaxPlusLinear.eye,
                              )
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
                                  color: AppColors.textColorSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // --- زر تسجيل الدخول ---
                          SizedBox(
                            height: 55,
                            child: state is LoginLoadingState
                                ? const Center(child: CircularProgressIndicator()) // لو بيحمل
                                : CustomButton(
                              text: 'تسجيل الدخول',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            ),
                          ),

                          const SizedBox(height: 25),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigateTo(context, RegisterScreen());
                                },
                                child: Text(
                                  "إنشاء حساب",
                                  style: GoogleFonts.alexandria(
                                    color: AppColors.primary500,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "ليس لديك حساب؟",
                                style: GoogleFonts.alexandria(
                                  color: AppColors.textColorDisable,
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
            ),
          );
        },
      ),
    );
  }
}