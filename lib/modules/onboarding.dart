import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muri_client/shared/styles/colors.dart';

import '../shared/components/Widgets/customProgressButton.dart';
import '../shared/components/Widgets/onboardingSlider.dart';
import '../shared/styles/backgroundClipper.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.primaryBlue),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        label: Text(
                          'تخطي',
                          style: GoogleFonts.alexandria(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  flex: 5,
                  child: Image.asset(
                    'assets/images/phone.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildDot(isActive: false),
                          buildDot(isActive: false),
                          buildDot(isActive: true),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Text('تنقلك صار أسهل',style:GoogleFonts.alexandria(
                              color: AppColors.primaryBlue,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 16,),
                          Text('احجز رحلتك إلى وجهتك بكل سهولة، واختر وقت الذهاب والعودة حسب جدولك.',textAlign: TextAlign.center,style:GoogleFonts.alexandria(
                              color: AppColors.textSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            height: 1.5
                          ),),
                          SizedBox(height: 24,),
                          CustomProgressButton(),
                          SizedBox(height: 20,)
                        ],
                      ),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
