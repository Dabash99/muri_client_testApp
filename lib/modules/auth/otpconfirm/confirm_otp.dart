import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/components/Widgets/backarrowbox.dart';
import '../../../shared/components/Widgets/custom_otp_field.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/functions.dart';
import '../../../shared/styles/backgroundClipper.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text.dart';
import '../../home/home_screen.dart';
import 'cubit/otp_cubit.dart';
import 'cubit/otp_state.dart';

class ConfirmOtp extends StatelessWidget {
  final String phonenumber;
  final String email;

  const ConfirmOtp({
    super.key,
    required this.phonenumber,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit()..startTimer(),
      child: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {
          if (state is OtpSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("تم تفعيل الحساب بنجاح، أهلاً بك!"),
                backgroundColor: Colors.green,
              ),
            );

            navigateAndFinish(context, const HomeScreen());
          }

          if (state is OtpErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          var cubit = OtpCubit.get(context);

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
                          height: 320,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.primary500,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 146,
                        child: Column(
                          children: [Image.asset(kLogo, height: 106)],
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 20,
                        child: BackArrowBox(
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),

                  // ================== Body Section ==================
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end, // محاذاة لليمين
                      children: [
                        const SizedBox(height: 30),

                        // العنوان الرئيسي
                        Text(
                          'تحقق من رقم الجوال',
                          style: AppTextStyles.boldBodyLarge(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 10),

                        // النص الفرعي مع الرقم
                        Text(
                          'لقد أرسلنا لك رمزاً مكوّناً من 4 أرقام عبر رقم الجوال\n$phonenumber',
                          style: AppTextStyles.regularLabel(
                            color: AppColors.textColorDisable,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl, // لضمان ظهور الرقم بشكل صحيح مع النص
                        ),
                        const SizedBox(height: 40),

                        // حقول الـ PIN Code
                        Directionality(
                          textDirection: TextDirection.ltr, // الـ PIN دائماً من اليسار لليمين
                          child: CustomOtpRow(
                            onCompleted: (code) {
                              print("Code Entered: $code");
                              // استدعاء الـ API
                              cubit.submitOtp(
                                otpCode: code,
                                email: email,
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 30),

                        // العداد + النص
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // النص الثابت
                            Text(
                              ':صلاحية الرمز تنتهي في',
                              style: AppTextStyles.regularLabel(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 5),
// الوقت
                            Text(
                              cubit.getTimerText(), // 02:12
                              style: const TextStyle(
                                color: AppColors.primary500,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Alexandria', // أو نوع الخط المستخدم عندك
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 15),

                        // زر إعادة الإرسال
                        Center(
                          child: TextButton(
                            onPressed: cubit.isTimerRunning
                                ? null
                                : () {
                              cubit.startTimer();
                              // هنا تستدعي دالة إعادة إرسال الكود
                              print("Resend OTP API Call");
                            },
                            child: Text(
                              'إعادة الإرسال',
                              style: GoogleFonts.alexandria(
                                color: cubit.isTimerRunning
                                    ? AppColors.textColorDisable
                                    : AppColors.primary500,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40), // مسافة قبل النص الأخير

                        // زر تعديل الرقم
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context); // يرجع للتسجيل للتعديل
                            },
                            child: Text(
                              'رقم الجوال غير صحيح؟ عدّله هنا',
                              style: GoogleFonts.alexandria(
                                color: AppColors.textColorDisable,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}