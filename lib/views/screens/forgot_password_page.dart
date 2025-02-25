import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/widgets/textUnderlne.dart';
import 'package:untitled/views/screens/sign_up_page.dart';

import '../base/components/custom_text_field.dart';
import '../base/widgets/app_custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(32, 108, 32, 0).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.forgotPassword,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      AppTextUnderline(),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  AppString.pleaseEnterYourEmailAddressToResetPassword,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 32.h),
                Text(
                  AppString.yourEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 14.h),
                AppCustomTextField(
                  containerChild: MyTextFormFieldWithIcon(
                    formHintText: AppString.enterEmail,
                    prefixIcon: Icon(Icons.mail, color: AppColors.primaryColor),
                  ),
                ),

                SizedBox(height: 32.h),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      /// TODO: OTP logic
                      // Get.to(VerifyEmailScreen());

                    },
                    child: Text(
                      AppString.sendOTP,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
               ],
            ),
          ),
        ),
      ),
    );
  }
}
