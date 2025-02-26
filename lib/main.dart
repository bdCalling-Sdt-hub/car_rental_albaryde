import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/screens/user_role/authentication/sign_in_page.dart';
import 'package:untitled/views/screens/user_role/profile/profile.dart';
import 'package:untitled/views/screens/user_role/setting/405_page.dart';
import 'package:untitled/views/screens/user_role/setting/setting_landing.dart';
import 'package:untitled/views/screens/user_role/setting/settings_template.dart';

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
          home: ProfileLandingScreen(),
          theme: AppTheme.defaultThemeData,
          initialBinding: ControllerBinder(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {}
}
