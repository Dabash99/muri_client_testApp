import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:muri_client/shared/components/functions.dart';
import '../../../shared/components/Widgets/backarrowbox.dart';
import '../../../shared/components/Widgets/customButton.dart';
import '../../../shared/components/Widgets/custom_textformfield.dart';
import '../../../shared/components/Widgets/date_picker.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/backgroundClipper.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text.dart';
import '../../TermsandConditions.dart';
import '../otpconfirm/confirm_otp.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

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

  @override
  Widget build(BuildContext context) {

  return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم إنشاء الحساب بنجاح ✅'),
                backgroundColor: Colors.green,
              ),
            );
            var myCubit = RegisterCubit.get(context);
            navigateTo(context, ConfirmOtp(phonenumber: '${myCubit.selectedCountryCode}${phoneController.text}',email: emailController.text,));
          }
          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);

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
                        child: Column(
                          children: [Image.asset(kLogo, height: 76)],
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

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'انضم إلى خدمة النقل الذكي',
                            style: AppTextStyles.boldBodyLarge(
                              color: AppColors.textColorPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "كن من آلاف المستخدمين المستفيدين من التطبيق كل يوم",
                            style: AppTextStyles.regularLabel(
                              color: AppColors.textColorDisable,
                            ),
                          ),
                          const SizedBox(height: 30),

                          Row(
                            children: [
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
                              const SizedBox(width: 10),
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

                            ],
                          ),
                          const SizedBox(height: 15),

                          CustomTextField(
                            label: 'الاسم العائلة',
                            hintText: 'ادخل اسم العائلة',
                            controller: familyNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'مطلوب';
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
                              if (value == null || value.isEmpty)
                                return 'مطلوب';
                              if (!value.contains('@'))
                                return 'بريد إلكتروني غير صحيح';
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),

                          CustomTextField(
                            label: 'تاريخ الميلاد',
                            hintText: 'mm/dd/yyyy',
                            suffixIcon: const Icon(IconsaxPlusLinear.calendar),
                            controller: dobController,
                            readOnly: true,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'مطلوب';
                              return null;
                            },
                            onTap: () {
                              showDatePickerBottomSheet(
                                context: context,
                                initialDate: DateTime.now(),
                                onDateSelected: (formattedDate, rawDate) {
                                  // لا نحتاج setState هنا لأن الـ Controller يحدث النص تلقائياً
                                  // ولكن لو أردت تحديث الواجهة لأي سبب آخر ممكن تستدعي emit في الكيوبت
                                  dobController.text = formattedDate;
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
                              if (value == null || value.isEmpty)
                                return 'برجاء إدخال رقم الهوية';
                              if (!RegExp(r'^[0-9]+$').hasMatch(value))
                                return 'رقم الهوية يجب أن يحتوي على أرقام فقط';
                              if (value.length != 10)
                                return 'رقم الهوية يجب أن يكون 10 أرقام';
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),

                          CustomTextField(
                            label: "رقم الجوال",
                            hintText: "ادخل رقم الجوال",
                            keyboardType: TextInputType.phone,
                            prefixIcon: CountryCodePicker(
                              onChanged: (country) {
                                cubit.updateCountryCode(country.dialCode!);
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
                              if (value == null || value.isEmpty)
                                return 'مطلوب';
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),

                          // حقل كلمة المرور
                          CustomTextField(
                            label: 'كلمة المرور',
                            hintText: 'برجاء إدخال كلمة المرور',
                            obscureText: cubit
                                .isPasswordVisible, // استخدام متغير الكيوبت
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              icon: Icon(
                                cubit.isPasswordVisible
                                    ? IconsaxPlusLinear.eye_slash
                                    : IconsaxPlusLinear.eye,
                              ),
                            ),
                            controller: passwordController,
                            onChanged: (val) {
                              if (confirmPasswordController.text.isNotEmpty) {
                                formKey.currentState!.validate();
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'برجاء إدخال كلمة المرور';
                              if (value.length < 8)
                                return 'كلمة المرور قصيرة (8 أحرف على الأقل)';
                              if (!value.contains(RegExp(r'[A-Z]')))
                                return 'يجب أن تحتوي على حرف كبير (A-Z)';
                              return null;
                            },
                          ),

                          const SizedBox(height: 15),

                          // حقل تأكيد كلمة المرور
                          CustomTextField(
                            label: 'تأكيد كلمة المرور',
                            hintText: 'برجاء إدخال كلمة المرور للتأكيد',
                            obscureText: cubit
                                .isConfirmPasswordVisible, // استخدام متغير الكيوبت الثاني
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeConfirmPasswordVisibility();
                              },
                              icon: Icon(
                                cubit.isConfirmPasswordVisible
                                    ? IconsaxPlusLinear.eye_slash
                                    : IconsaxPlusLinear.eye,
                              ),
                            ),
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'برجاء تأكيد كلمة المرور';
                              if (value != passwordController.text)
                                return 'كلمة المرور غير متطابقة';
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),

                          state is RegisterLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  text: 'إنشاء حساب',
                                  onPressed: () {

                                    if (formKey.currentState!.validate()) {
                                      cubit.userRegister(
                                        firstName: firstNameController.text,
                                        secondName: secondNameController.text,
                                        familyName: familyNameController.text,
                                        email: emailController.text,
                                        birthDate: dobController.text,
                                        nationalId: nationalIdController.text,
                                        phone: phoneController.text,
                                        password: passwordController.text,
                                        confirmPassword:
                                            confirmPasswordController.text,
                                        nationality: nationalIdController.text,
                                      );
                                    }
                                  },
                                ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'بالضغط على إنشاء حساب، فأنت توافق على',
                                style: AppTextStyles.regularSmall(
                                  color: AppColors.neutral600,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateTo(context, Termsandconditions());
                                },
                                child: Text(
                                  ' سياسة الإستخدام والخصوصية',
                                  style: AppTextStyles.regularSmall(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "لديك حساب بالفعل؟",
                                style: GoogleFonts.alexandria(
                                  color: AppColors.textColorDisable,
                                  fontSize: 14,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                    color: AppColors.primary500,
                                    fontWeight: FontWeight.bold,
                                  ),
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
        },
      ),
    );
  }
}
