import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';
import 'package:untitled/views/base/widgets/app_custom_textfield.dart';
import 'package:untitled/views/screens/user_role/setting/setting_landing.dart';

import '../../../../utilities/app_icons.dart';
import '../../../base/components/network_svg_image .dart';
import '../../../base/components/settings_components.dart';

class SettingTemplatePage extends StatelessWidget {
  const SettingTemplatePage({
    super.key,
    required this.appBarText,
    this.title1,
    this.subTitle1,
    this.content1,
    this.title2,
    this.subTitle2,
    this.content2,
    this.isSupportPage = false,
  });

  final String appBarText;
  final String? title1;
  final String? subTitle1;
  final String? content1;
  final String? title2;
  final String? subTitle2;
  final String? content2;
  final bool isSupportPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (Column(
          children: [
            CustomAppbar(appBarHeadingText: appBarText),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).w,
              child:
                  isSupportPage
                      ? SettingComponents(
                        supportPage: true,
                        leading: NetworkSvgImage(
                          assetName: AppIcons.gmailIcon,
                          height: 24.h,
                        ),
                        bodyText: AppString.supportMail,
                        endIcon: null,
                      )
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          title1 != null
                              ? Text(
                                title1!,
                                style: Theme.of(context).textTheme.displayLarge,
                              )
                              : SizedBox.shrink(),
                          SizedBox(height: 6.h),
                          subTitle1 != null
                              ? Text(
                                subTitle1!,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                              : SizedBox.shrink(),
                          SizedBox(height: 24.h),
                          content1 != null
                              ? Text(
                                content1!,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(color: AppColors.black),
                              )
                              : SizedBox.shrink(),
                          SizedBox(height: 24.h),
                          title2 != null
                              ? Text(
                                title2!,
                                style: Theme.of(context).textTheme.displayLarge,
                              )
                              : SizedBox.shrink(),
                          SizedBox(height: 6.h),
                          subTitle2 != null
                              ? Text(
                                subTitle2!,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                              : SizedBox.shrink(),
                          SizedBox(height: 24.h),
                          content2 != null
                              ? Text(
                                content2!,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(color: AppColors.black),
                              )
                              : SizedBox.shrink(),
                        ],
                      ),
            ),
          ],
        )),
      ),
    );
  }
}
