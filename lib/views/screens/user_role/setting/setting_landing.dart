import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';
import 'package:untitled/views/screens/user_role/setting/settings_password_change.dart';
import 'package:untitled/views/screens/user_role/setting/settings_template.dart';

import '../../../base/components/settings_components.dart';

class SettingsLandingPage extends StatelessWidget {
  const SettingsLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (Column(
          children: [
            CustomAppbar(appBarHeadingText: AppString.setting),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).w,
              child: Column(
                children: [
                  SettingComponents(
                    leading: Icon(Icons.lock),
                    bodyText: AppString.changePassword,
                    onTap: () {
                      Get.to(SettingsPasswordChangePage());
                    },
                  ),
                  SizedBox(height: 16.h),
                  SettingComponents(
                    leading: Icon(CupertinoIcons.bookmark_fill),
                    bodyText: AppString.privacyPolicy,
                    onTap: () {
                      Get.to(
                        SettingTemplatePage(
                          appBarText: AppString.privacyPolicy,
                          title1: AppString.privacyPolicy,
                          subTitle1: AppString.privacyPolicyLastUpdate,
                          content1: AppString.privacyPolicyContent,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  SettingComponents(
                    leading: Icon(CupertinoIcons.exclamationmark_triangle_fill),
                    bodyText: AppString.termsAndConditions,
                    onTap: () {
                      Get.to(
                        SettingTemplatePage(
                          appBarText: AppString.termsAndConditions,
                          title1: AppString.termsAndConditions,
                          subTitle1: AppString.termsConditionsLastUpdate1,
                          content1: AppString.termsConditionsContent1,
                          title2: AppString.termsAndConditions,
                          subTitle2: AppString.termsConditionsLastUpdate2,
                          content2: AppString.termsConditionsContent2,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  SettingComponents(
                    leading: Icon(CupertinoIcons.info_circle_fill),
                    bodyText: AppString.aboutUs,
                    onTap: () {
                      Get.to(
                        SettingTemplatePage(
                          appBarText: AppString.aboutUs,
                          title1: AppString.aboutUs,
                          content1: AppString.aboutUsContent,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  SettingComponents(
                    leading: Icon(Icons.headphones),
                    bodyText: AppString.support,
                    onTap: () {
                      Get.to(
                        SettingTemplatePage(
                          appBarText: AppString.support,
                          isSupportPage: true,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}


