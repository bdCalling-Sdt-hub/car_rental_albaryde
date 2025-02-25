import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_toast.dart';
import 'package:untitled/views/base/widgets/textUnderlne.dart';

import '../base/components/custom_text_field.dart';
import '../base/widgets/app_custom_modal.dart';
import '../base/widgets/app_custom_textfield.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _resetPassTEController =
        TextEditingController();
    final TextEditingController _confirmPassTeController =
        TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                          AppString.resetPassword,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        AppTextUnderline(),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),

                  Center(
                    child: Text(
                      AppString.enterANewPassword,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    AppString.password,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 14.h),
                  AppCustomTextField(
                    containerChild: MyTextFormFieldWithIcon(
                      isPassword: true,
                      formHintText: AppString.password,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      ),
                      controller: _resetPassTEController,
                    ),
                  ),

                  SizedBox(height: 16.h),
                  Text(
                    AppString.confirmPassword,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 14.h),
                  AppCustomTextField(
                    containerChild: MyTextFormFieldWithIcon(
                      isPassword: true,
                      formHintText: AppString.confirmPassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      ),
                      controller: _confirmPassTeController,
                    ),
                  ),

                  SizedBox(height: 32.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        // TODO: Reset pass logic
                        if (_resetPassTEController.text.trim() ==
                            _confirmPassTeController.text.trim()) {
                          CustomToast().showToast(
                            context: context,
                            message: 'Pasasdfsdfsdwords do not match !!',
                            isError: true,
                          );
                          return;
                        }
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24).r,
                            ), // Curved top border
                          ),
                          builder: (BuildContext context) {
                            return AppCustomModal();
                          },
                        );
                      },
                      child: Text(
                        AppString.resetPassword,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
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
}
