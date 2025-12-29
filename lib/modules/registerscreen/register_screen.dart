import 'package:flutter/material.dart';
import '../../shared/components/Widgets/backarrowbox.dart';
import '../../shared/components/Widgets/customButton.dart';
import '../../shared/components/Widgets/custom_textformfield.dart';
import '../../shared/components/Widgets/text.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/backgroundClipper.dart';
import '../../shared/styles/colors.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController secondNameController = TextEditingController();

  final TextEditingController familyNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController dobController = TextEditingController();

  final TextEditingController nationalIdController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible1= false;
  bool isPasswordVisible2= false;

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
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
                Positioned(
                  top: 54,
                  child: Column(
                    children: [
                      Image.asset(kLogo, height: 76),
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  textBold(label: "انضم إلى خدمة النقل الذكي"),
                  const SizedBox(height: 8),
                  textreg(
                    label: "كن من آلاف المستخدمين المستفيدين من التطبيق كل يوم",

                  ),
                  const SizedBox(height: 30),

                  // 2. ربط الـ Controllers بالحقول
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'الاسم الثاني',
                          hintText: 'ادخل الاسم الثاني',
                          controller: secondNameController,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          label: 'الاسم الأول',
                          hintText: 'ادخل اسمك الأول',
                          controller: firstNameController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  CustomTextField(
                    label: 'الاسم العائلة',
                    hintText: 'ادخل اسم العائلة',
                    controller: familyNameController,
                  ),
                  const SizedBox(height: 15),

                  CustomTextField(
                    label: 'البريد الإلكتروني',
                    hintText: 'ادخل حسابك',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),

                  CustomTextField(
                    label: 'تاريخ الميلاد',
                    hintText: 'mm/dd/yyyy',
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    controller: dobController,
                  ),
                  const SizedBox(height: 15),

                  CustomTextField(
                    label: 'رقم الهوية الوطنية',
                    hintText: '1xxxxxxxxx',
                    keyboardType: TextInputType.number,
                    controller: nationalIdController
                  ),
                  const SizedBox(height: 15),

                  CustomTextField(
                    label: 'رقم الجوال',
                    hintText: 'ادخل رقم الجوال',
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icon(Icons.flag),
                    controller: phoneController,
                  ),
                  const SizedBox(height: 15),

                  CustomTextField(
                    label: 'كلمة المرور',
                    hintText: 'برجاء إدخال كلمة المرور',
                    obscureText: true,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible2 = !isPasswordVisible2;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible2
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                    controller: passwordController,
                  ),

                  const SizedBox(height: 10),

                  const SizedBox(height: 15),

                  CustomTextField(
                    label: 'تأكيد كلمة المرور',
                    hintText: 'برجاء إدخال كلمة المرور للتأكيد',
                    obscureText: true,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible1 = !isPasswordVisible1;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible1
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(text: 'إنشاء حساب', onPressed: () {
                    print("الاسم: ${firstNameController.text} ${familyNameController.text}");
                    print("الايميل: ${emailController.text}");
                  },),
                  const SizedBox(height: 15),
                  Center(
                    child: Text(
                      "بالضغط على إنشاء حساب، فأنت توافق على سياسة الاستخدام والخصوصية",
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                    ),
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
                          style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text("لديك حساب بالفعل؟", style: TextStyle(color: Colors.grey)),
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