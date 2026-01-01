import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      primaryColor: AppColors.primary500,
      scaffoldBackgroundColor: AppColors.bg1,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary500,
        secondary: AppColors.primary500,
        surface: AppColors.bg1,
        background: AppColors.bg1,
        onPrimary: Colors.white,
        onSurface: AppColors.textColorPrimary,
      ),

      textTheme: GoogleFonts.alexandriaTextTheme().copyWith(
        displayLarge: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),



      iconTheme: const IconThemeData(
        size: 24,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary500,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary500,
        unselectedItemColor: AppColors.textColorPrimary,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
      ),
    );
  }
}