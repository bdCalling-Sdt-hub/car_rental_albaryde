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

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _phoneNumberTeController =
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
                CustomAppbar(appBarHeadingText: AppString.editProfile),
                SizedBox(height: 14.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24).w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 14.h),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          formHintText: AppString.enterName,
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: AppColors.primaryColor,
                          ),
                          controller: _addressTEController,
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
                        AppString.address,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 14.h),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          formHintText: AppString.typeLocation,
                          prefixIcon: Icon(
                            Icons.location_on_rounded,
                            color: AppColors.primaryColor,
                          ),
                          controller: _nameTEController,
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
                        AppString.phoneNumber,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 14.h),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          formHintText: AppString.phoneNumberHintText,
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.flag_circle),
                            color: AppColors.primaryColor,
                          ),
                          controller: _phoneNumberTeController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} Password again !!';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 100.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            clearingTextField();
                            //TODO: update logic
                            CustomToast().showToast(
                              context: context,
                              message: 'Profile Updated',
                            );
                            // TODO: return to Dashboard
                          },
                          child: Text(
                            AppString.updateProfile,
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
    _addressTEController.clear();
    _nameTEController.clear();
    _phoneNumberTeController.clear();
  }

  @override
  void dispose() {
    _addressTEController.dispose();
    _phoneNumberTeController.dispose();
    _nameTEController.dispose();
    super.dispose();
  }
}
