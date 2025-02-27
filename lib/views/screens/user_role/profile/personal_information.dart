import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_constant.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';
import 'package:untitled/views/screens/user_role/profile/edit_profile.dart';

import '../../../../utilities/app_icons.dart';
import '../../../base/components/network_svg_image .dart';
import '../../../base/components/upload_photo_dialog.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar(appBarHeadingText: AppString.personalInformation),
              SizedBox(height: 16.h),
              // Profile card section
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: 120.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(
                              color: AppColors.primaryColor, // Border color
                              width: 2.w, // Border width
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(22.r),
                            child: Image.network(
                              AppConstant.placeHolderImageUrl,
                              fit:
                                  BoxFit
                                      .fill, // Ensure the image fills the container
                            ),
                          ),
                        ),
                        // Edit icon inside a box, positioned at the bottom-right
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              showUploadPhotoDialog(context);
                            },
                            child: NetworkSvgImage(
                              assetName: AppIcons.editIcon,
                              height: 32.h, // Set the icon size
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      padding: EdgeInsets.all(16.0.r),
                      margin: EdgeInsets.symmetric(horizontal: 12.0.r),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldShade,
                        // Background color of the card
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.black.withValues(alpha: 0.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withValues(alpha: 0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end, 
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.to(EditProfilePage());
                                },
                                child: Text(
                                  AppString.editProfile,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            AppString.personalInformation,
                            style: Theme.of(context).textTheme.displayLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 24.h),
                          // Name Section
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_circle,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.displaySmall!.copyWith(
                                      fontSize: 12,
                                      color: AppColors.grey.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Bashar Isalm',
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              NetworkSvgImage(
                                assetName: AppIcons.gmailIcon,
                                height: 24.h,
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.email,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.displaySmall!.copyWith(
                                      fontSize: 12,
                                      color: AppColors.grey.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    AppString.supportMail,
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, color: AppColors.primaryColor),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.phoneNumber,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.displaySmall!.copyWith(
                                      fontSize: 12,
                                      color: AppColors.grey.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    AppString.phoneNumberHintText,
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.address,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.displaySmall!.copyWith(
                                      fontSize: 12,
                                      color: AppColors.grey.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Rangpur bangladesh',
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
