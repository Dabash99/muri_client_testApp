import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muri_client/shared/components/functions.dart';
import 'package:muri_client/shared/styles/colors.dart';

import '../shared/components/Widgets/customProgressButton.dart';
import '../shared/styles/backgroundClipper.dart';
import 'login/loginScreen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentIndex = 0;
  // نحتاج 2 كونترولر: واحد للصور (الرئيسي) وواحد للنصوص (تابع)
  final PageController _imagesController = PageController();
  final PageController _textController = PageController();

  final List<Map<String, String>> contents = [
    {
      "image": "assets/images/onboardingback1.png",
      "title": "تنقلك صار أسهل",
      "desc": "احجز رحلتك إلى وجهتك بكل سهولة، واختر وقت الذهاب والعودة حسب جدولك."
    },
    {
      "image": "assets/images/onboardingback2.png",
      "title": "كل شيء تحت نظرتك",
      "desc": "تابع جدول رحلاتك، حالات الحجز، والمواعيد اليومية في مكان واحد."
    },
    {
      "image": "assets/images/onboardingback3.png",
      "title": "نوصلك بأمان",
      "desc": "كابتن موثوق بهم، تنبيهات مباشرة، وتواصل سريع في حال احتجت أي شيء."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // =========================================================
          // 1. الطبقة الخلفية: الصور داخل الـ ClipPath (المتحركة)
          // =========================================================
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65, // 65% من الشاشة
              width: double.infinity,
              color: AppColors.primaryBlue, // لون خلفية احتياطي

              // هنا وضعنا الـ PageView داخل الـ ClipPath
              child: PageView.builder(
                controller: _imagesController,
                itemCount: contents.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                  // أمر لتحريك نصوص الأسفل لتلحق بالصور
                  _textController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    contents[index]['image']!,
                    fit: BoxFit.cover, // مهم جداً: لتغطية المساحة المقوسة بالكامل
                  );
                },
              ),
            ),
          ),

          // =========================================================
          // 2. الطبقة الأمامية: النصوص والأزرار
          // =========================================================
          SafeArea(
            child: Column(
              children: [
                // --- الهيدر (أزرار التخطي والرجوع) ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // زر تخطي
                      _currentIndex != contents.length - 1
                          ? TextButton.icon(
                        onPressed: () {
                          _imagesController.jumpToPage(contents.length - 1);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
                        label: Text(
                          'تخطي',
                          style: GoogleFonts.alexandria(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                      )
                          : const SizedBox(width: 60),

                      // زر السهم المربع (الرجوع)
                      _currentIndex > 0
                          ? Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                          onPressed: () {
                            _imagesController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      )
                          : const SizedBox(width: 40),
                    ],
                  ),
                ),

                const Spacer(flex: 6),
                SizedBox(height: 200,),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // النقاط (Dots)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                              (dotIndex) => buildDot(dotIndex),
                        ),
                      ),

                      SizedBox(
                        height: 120, // ارتفاع محدد للنصوص
                        child: PageView.builder(
                          controller: _textController,
                          itemCount: contents.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    contents[index]['title']!,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.alexandria(
                                      color: AppColors.primaryBlue,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    contents[index]['desc']!,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.alexandria(
                                      color: AppColors.textSecondary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // --- الزر السفلي ---
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 10),
                  child: CustomProgressButton(
                    percentage: (_currentIndex + 1) / contents.length,
                    onPressed: () {
                      if (_currentIndex < contents.length - 1) {
                        _imagesController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        navigateAndFinish(context, Loginscreen());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    bool isActive = index == _currentIndex;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 30 : 10,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryBlue : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}