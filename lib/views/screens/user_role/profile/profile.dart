import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';
import 'package:untitled/views/screens/user_role/profile/personal_information.dart';

import '../../../../utilities/app_constant.dart';
import '../../../base/components/settings_components.dart';
import '../../../base/widgets/app_alert_dialog.dart';
import '../setting/setting_landing.dart';

class ProfileLandingScreen extends StatelessWidget {
  const ProfileLandingScreen({super.key});

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
                    // Image with proper clipping, full display, and border
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
                    SizedBox(height: 12.h),
                    // Name
                    Text(
                      'Faopu Hawo',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: 5.h),
                    // Rating
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '4.9',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SettingComponents(
                      leading: Icon(
                        Icons.account_circle,
                        color: AppColors.grey.withValues(alpha: 0.6),
                      ),
                      bodyText: AppString.personalInformation,
                      onTap: () {
                        Get.to(PersonalInformationPage());
                      },
                    ),
                    SizedBox(height: 16.h),
                    SettingComponents(
                      leading: Icon(
                        CupertinoIcons.bookmark_fill,
                        color: AppColors.grey.withValues(alpha: 0.6),
                      ),
                      bodyText: AppString.referralCode,
                      onTap: () {
                        // Get.to();
                      },
                    ),
                    SizedBox(height: 16.h),
                    SettingComponents(
                      leading: Icon(
                        Icons.account_balance_wallet,
                        color: AppColors.grey.withValues(alpha: 0.6),
                      ),
                      bodyText: AppString.myWallet,
                      onTap: () {
                        // Get.to();
                      },
                    ),
                    SizedBox(height: 16.h),
                    SettingComponents(
                      leading: Icon(
                        CupertinoIcons.gear_alt_fill,
                        color: AppColors.grey.withValues(alpha: 0.6),
                      ),
                      bodyText: AppString.setting,
                      onTap: () {
                        // Get.to();
                      },
                    ),
                    SizedBox(height: 16.h),
                    SettingComponents(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: AppColors.grey.withValues(alpha: 0.6),
                      ),
                      bodyText: AppString.logout,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AppAlertDialog(
                                title: AppString.logOut,
                                content:
                                    AppString
                                        .areYouSureYouWantToLogOut, // You can change this color if needed
                              ),
                        );
                        // Get.to();
                      },
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
