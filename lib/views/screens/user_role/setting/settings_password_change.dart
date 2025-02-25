import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';
import 'package:untitled/views/base/components/custom_toast.dart';
import 'package:untitled/views/base/widgets/textUnderlne.dart';

import '../../../base/components/custom_text_field.dart';
import '../../../base/widgets/app_custom_modal.dart';
import '../../../base/widgets/app_custom_textfield.dart';

class SettingsPasswordChangePage extends StatefulWidget {
  const SettingsPasswordChangePage({super.key});

  @override
  State<SettingsPasswordChangePage> createState() =>
      _SettingsPasswordChangePageState();
}

class _SettingsPasswordChangePageState
    extends State<SettingsPasswordChangePage> {
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _oldPassTEController = TextEditingController();
  final TextEditingController _confirmPassTeController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppbar(appBarHeadingText: AppString.changePassword),
                SizedBox(height: 14.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24).w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.oldPassword,
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
                          controller: _oldPassTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} Password !!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        AppString.newPassword,
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
                          controller: _newPassTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} Password !!';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 16.h),
                      Text(
                        AppString.confirmPassword,
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
                          controller: _confirmPassTeController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} Password again !!';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 32.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            clearingTextField();
                            if (_newPassTEController.text.trim() !=
                                _confirmPassTeController.text.trim()) {
                              CustomToast().showToast(
                                context: context,
                                message: AppString.passwordsDoNotMatch,
                                isError: true,
                              );
                              return;
                            }
                            // TODO: password Reset logic
                            // if (_formKey.currentState!.validate()) {}
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
                            ).whenComplete(() {
                              // This callback is called when the modal is dismissed
                              FocusScope.of(context).unfocus();
                            });
                            ;
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearingTextField() {
    _oldPassTEController.clear();
    _newPassTEController.clear();
    _confirmPassTeController.clear();
  }

  @override
  void dispose() {
    _oldPassTEController.dispose();
    _confirmPassTeController.dispose();
    _newPassTEController.dispose();
    super.dispose();
  }
}
