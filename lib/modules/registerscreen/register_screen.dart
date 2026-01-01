import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:muri_client/shared/components/functions.dart';
import '../../shared/components/Widgets/backarrowbox.dart';
import '../../shared/components/Widgets/customButton.dart';
import '../../shared/components/Widgets/custom_textformfield.dart';
import '../../shared/components/Widgets/date_picker.dart';
import '../../shared/styles/text.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/backgroundClipper.dart';
import '../../shared/styles/colors.dart';
import '../TermsandConditions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String selectedCountryCode = '+966';
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;

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
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primary500,
                    ),
                  ),
                ),
                Positioned(
                  top: 54,
                  child: Column(children: [Image.asset(kLogo, height: 76)]),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: BackArrowBox(onPressed: () => Navigator.pop(context)),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextBoldBodyLarge(
                      label: "انضم إلى خدمة النقل الذكي",
                      color: AppColors.textColorPrimary,
                    ),
                    const SizedBox(height: 8),
                    TextRegularLabel(
                      label:
                          "كن من آلاف المستخدمين المستفيدين من التطبيق كل يوم",
                      color: AppColors.textColorDisable,
                    ),
                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'الاسم الثاني',
                            hintText: 'ادخل الاسم الثاني',
                            controller: secondNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'مطلوب';
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            label: 'الاسم الأول',
                            hintText: 'ادخل اسمك الأول',
                            controller: firstNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'مطلوب';
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      label: 'الاسم العائلة',
                      hintText: 'ادخل اسم العائلة',
                      controller: familyNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'مطلوب';
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      label: 'البريد الإلكتروني',
                      hintText: 'ادخل حسابك',
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'مطلوب';
                        if (!value.contains('@'))
                          return 'بريد إلكتروني غير صحيح';
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      label: 'تاريخ الميلاد',
                      hintText: 'mm/dd/yyyy',
                      prefixIcon: const Icon(IconsaxPlusLinear.calendar),
                      controller: dobController,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'مطلوب';
                      },
                      onTap: () {
                        showDatePickerBottomSheet(
                          context: context,
                          initialDate: DateTime.now(),
                          onDateSelected: (formattedDate, rawDate) {

                            setState(() {
                              dobController.text = formattedDate;
                            });

                            print("تم اختيار التاريخ: $formattedDate");
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      label: 'رقم الهوية الوطنية',
                      hintText: '1xxxxxxxxx',
                      keyboardType: TextInputType.number,
                      controller: nationalIdController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'برجاء إدخال رقم الهوية';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'رقم الهوية يجب أن يحتوي على أرقام فقط';
                        }
                        if (value.length != 10) {
                          return 'رقم الهوية يجب أن يكون 10 أرقام';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      label: "رقم الجوال",
                      hintText: "ادخل رقم الجوال",
                      keyboardType: TextInputType.phone,
                      suffixIcon: CountryCodePicker(
                        onChanged: (country) {
                          setState(() {
                            selectedCountryCode = country.dialCode!;
                          });
                        },
                        initialSelection: 'SA',
                        countryFilter: const ['EG', 'SA'],
                        textStyle: const TextStyle(
                          fontFamily: 'Alexandria',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        dialogTextStyle: const TextStyle(
                          fontFamily: 'Alexandria',
                        ),
                        flagWidth: 20,
                        padding: const EdgeInsets.all(8),
                      ),
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'مطلوب';
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      label: 'كلمة المرور',
                      hintText: 'برجاء إدخال كلمة المرور',
                      obscureText: !isPasswordVisible2,
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible2 = !isPasswordVisible2;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible2
                              ? IconsaxPlusLinear.eye
                              : IconsaxPlusLinear.eye_slash,
                        ),
                      ),
                      controller: passwordController,
                      onChanged: (val) {
                        // لو حابب تتأكد من التطابق لحظياً
                        if (confirmPasswordController.text.isNotEmpty) {
                          formKey.currentState!.validate();
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'برجاء إدخال كلمة المرور';
                        }
                        if (value.length < 8) {
                          return 'كلمة المرور قصيرة (8 أحرف على الأقل)';
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'يجب أن تحتوي على حرف كبير (A-Z)';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    CustomTextField(
                      label: 'تأكيد كلمة المرور',
                      hintText: 'برجاء إدخال كلمة المرور للتأكيد',
                      obscureText: !isPasswordVisible1,
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible1 = !isPasswordVisible1;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible1
                              ? IconsaxPlusLinear.eye
                              : IconsaxPlusLinear.eye_slash,
                        ),
                      ),
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'برجاء تأكيد كلمة المرور';
                        }
                        if (value != passwordController.text) {
                          return 'كلمة المرور غير متطابقة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    CustomButton(
                      text: 'إنشاء حساب',
                      onPressed: () {
                        // 3. التحقق النهائي هنا
                        if (formKey.currentState!.validate()) {
                          print("الفورم سليم وجاهز للإرسال ✅");
                          print("الاسم: ${firstNameController.text}");
                        } else {
                          print("فيه أخطاء في البيانات ❌");
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            navigateTo(context, Termsandconditions());
                          },
                          child: TextRegularSmall(
                            label: ' سياسة الإستخدام والخصوصية',
                          ),
                        ),
                        TextRegularSmall(
                          label: 'بالضغط على إنشاء حساب، فأنت توافق على',
                          color: AppColors.neutral600,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // الرجوع لتسجيل الدخول
                          },
                          child: const Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                              color: AppColors.primary500,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "لديك حساب بالفعل؟",
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
            ),
          ],
        ),
      ),
    );
  }
}
