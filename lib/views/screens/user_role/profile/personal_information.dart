import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';

import '../../../../utilities/app_icons.dart';
import '../../../base/components/network_svg_image .dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar(appBarHeadingText: AppString.profile),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          // Rounded corners
                          child: Container(
                            width: 120.w,
                            height: 150.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primaryColor, // Border color
                                width: 2.w, // Border width
                              ),
                            ),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              fit:
                                  BoxFit
                                      .cover, // Ensure the image fills the container
                            ),
                          ),
                        ),
                        // Edit icon inside a box, positioned at the bottom-right
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: NetworkSvgImage(
                            assetName: AppIcons.editIcon,
                            height: 32.h, // Set the icon size
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // "Edit Profile" Button on the right and underlined
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Add functionality to edit profile here
                                },
                                child: Text(
                                  "Edit Profile",
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
                            'Personal Information',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          SizedBox(height: 16.h),
                          // Name Section
                          Row(
                            children: [
                              Icon(
                                Icons.account_circle,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Bashar Isalm',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          // Email Section
                          Row(
                            children: [
                              Icon(Icons.email, color: AppColors.primaryColor),
                              SizedBox(width: 8.w),
                              Text(
                                'Support.Info@Gmail.Com',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          // Phone Number Section
                          Row(
                            children: [
                              Icon(Icons.phone, color: AppColors.primaryColor),
                              SizedBox(width: 8.w),
                              Text('01780', style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          // Address Section
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Rangpur Bangladesh',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
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
