import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_strings.dart';

import 'package:untitled/views/base/widgets/textUnderlne.dart';
import 'package:untitled/views/screens/user_role/authentication/forgot_password_page.dart';
import 'package:untitled/views/screens/user_role/authentication/sign_up_page.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_icons.dart';
import '../../../base/components/custom_text_field.dart';
import '../../../base/components/network_svg_image .dart';
import '../../../base/widgets/app_custom_textfield.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailTEController = TextEditingController();

  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(32, 108, 32, 0).w,
            child: Form(
              key: _formKey,
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
                          AppString.signInToYourAccount,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        AppTextUnderline(),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Center(
                    child: Text(
                      AppString.welcomeBackSignInUsingYourSocialAccountOr,
                      style: Theme.of(context).textTheme.displayMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Center(
                    child: Text(
                      AppString.emailToContinueUs,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    AppString.yourEmail,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 14.h),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      formHintText: AppString.enterEmail,
                      prefixIcon: Icon(Icons.mail,color: AppColors.primaryColor),
                      controller: _emailTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} Email !!';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print("Email Input: $value");
                      },
                    ),
                  ),

                  SizedBox(height: 16.h),
                  Text(
                    AppString.password,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 14.h),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      isPassword: true,
                      formHintText: AppString.enterPassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      ),
                      controller: _passwordTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} Password !!';
                        }
                        return null;
                      },

                      onChanged: (value) {
                        print("Email Input: $value");
                      },
                    ),
                  ),

                  SizedBox(height: 32.h),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.to(ForgotPasswordScreen());
                      },
                      child: Text(
                        AppString.forgotPassword,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO:signIn logic
                        // if (_formKey.currentState!.validate()) {}
                        FocusScope.of(context).unfocus();
                        clearingTextField();
                      },
                      child: Text(
                        AppString.signIn,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppString.dontHaveAnAccount),
                        TextButton(
                          onPressed: () {
                            Get.to(SignUPPage());
                          },
                          child: Text(
                            AppString.signUp,
                            style: Theme.of(context).textTheme.headlineMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // validate Email Address
  String? isEmailValid(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    ).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void clearingTextField() {
    _emailTEController.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
