import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/screens/forgot_password_page.dart';
import 'package:untitled/views/screens/reset_password.dart';
import 'package:untitled/views/screens/sign_in_page.dart';
import 'package:untitled/views/screens/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          home: ResetPasswordPage(),
          theme: AppTheme.defaultThemeData,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
