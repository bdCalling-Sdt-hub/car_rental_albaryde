import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';
import 'package:untitled/views/screens/user_role/setting/settings_password_change.dart';

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
                    bodyText: AppString.changePassword,
                  ),
                  SizedBox(height: 16.h),
                  SettingComponents(
                    leading: Icon(CupertinoIcons.exclamationmark_triangle_fill),
                    bodyText: AppString.changePassword,
                  ),
                  SizedBox(height: 16.h),
                  SettingComponents(
                    leading: Icon(CupertinoIcons.info_circle_fill),
                    bodyText: AppString.changePassword,
                  ),
                  SizedBox(height: 16.h),
                  SettingComponents(
                    leading: Icon(Icons.headphones),
                    bodyText: AppString.changePassword,
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

class SettingComponents extends StatelessWidget {
  final Widget leading;
  final String bodyText;
  final Widget? endIcon;
  final VoidCallback? onTap;

  const SettingComponents({
    super.key,
    required this.leading,
    required this.bodyText,
    this.endIcon = const Icon(Icons.keyboard_arrow_right),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(16).r, // Rounded shape
      ),
      leading: leading,
      title: Text(bodyText),
      trailing: endIcon,
      onTap: onTap,
    );
  }
}
