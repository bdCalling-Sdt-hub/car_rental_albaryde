import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/screens/user_role/authentication/sign_in_page.dart';
import '../../../../utilities/app_icons.dart';
import '../../../base/components/custom_text_field.dart';
import '../../../base/components/network_svg_image .dart';
import '../../../base/widgets/app_custom_textfield.dart';
import '../../../base/widgets/textUnderlne.dart';

class SignUPPage extends StatefulWidget {
  const SignUPPage({super.key});

  @override
  State<SignUPPage> createState() => _SignUPPageState();
}

class _SignUPPageState extends State<SignUPPage> {
  final TextEditingController _userNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(32, 80, 32, 0).w,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          AppString.signUpWithEmail,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        AppTextUnderline(),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Center(
                    child: Text(
                      AppString.welcomeBackPleaseEnterYourDetails,
                      style: Theme.of(context).textTheme.displayMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    AppString.userName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 14.h),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      formHintText: AppString.enterUserName,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.primaryColor,
                      ),
                      controller: _userNameTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} User Name !!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppString.yourEmail,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 14.h),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      formHintText: AppString.enterEmail,
                      prefixIcon: Icon(
                        Icons.mail,
                        color: AppColors.primaryColor,
                      ),
                      controller: _emailTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} Email !!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppString.phoneNumber,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 14.h),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      formHintText: AppString.phoneNumberHintText,
                      keyBoardType: TextInputType.number,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: AppColors.primaryColor,
                      ),
                      controller: _phoneTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} Phone Number !!';
                        }
                        return null;
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
                    ),
                  ),
                  Text(
                    AppString.confirmPassword,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 14.h),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      isPassword: true,
                      formHintText: AppString.confirmPassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      ),
                      controller: _confirmPasswordTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} Password again !!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                        },
                        checkColor: AppColors.white,
                        focusColor: AppColors.white,
                        activeColor: AppColors.primaryColor,
                      ),
                      Expanded(
                        child: Text(
                          AppString
                              .byCreatingAnAccountIAcceptTheTermsConditions,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _isChecked
                                ? AppColors.primaryColor
                                : AppColors.primaryColor.withValues(alpha: .5),
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        if (_isChecked) {
                          setState(() {
                            clearTextFields(); // Clear fields inside setState to trigger UI refresh
                          });

                          // TODO: Sign up logic
                          // if (_formKey.currentState!.validate()) {}
                        }
                      },
                      child: Text(
                        AppString.signUp,
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
                        Text(AppString.haveAnAccount),
                        TextButton(
                          onPressed: () {
                            Get.to(SignInPage());
                          },
                          child: Text(
                            AppString.signIn,
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

  void clearTextFields() {
    _userNameTEController.clear();

    _emailTEController.clear();

    _phoneTEController.clear();

    _passwordTEController.clear();

    _confirmPasswordTEController.clear();
  }

  @override
  void dispose() {
    _userNameTEController.dispose();
    _emailTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
