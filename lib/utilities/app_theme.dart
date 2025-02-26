import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData defaultThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.grey,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0.r),
        borderSide: BorderSide.none, // Invisible border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0.r),
        borderSide: BorderSide.none, // Invisible border
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0.r),
        borderSide: BorderSide.none, // Invisible border
      ),
      hintStyle: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.grey.withValues(alpha: 0.7),
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'quicksand',
        fontSize: 18.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.grey,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.black,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.black,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(fontFamily: 'quicksand', color: AppColors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24).w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
    ),
  );
}
