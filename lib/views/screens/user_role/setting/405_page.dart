import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_asset_path.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/screens/user_role/authentication/sign_in_page.dart';

import '../../../../utilities/app_icons.dart';
import '../../../base/components/network_svg_image .dart';

class Error405Page extends StatelessWidget {
  const Error405Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: NetworkSvgImage(
                assetName: AppAssetPath.errorImagePath404,
                height: 250.h,
                width: 250.w,
              ),
            ),
            Text(
              'Oops!',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontSize: 24),
            ),
            SizedBox(height: 16.h),
            Text(
              AppString.pageNotFound,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ///TODO: Homepage navigation
                  Get.to(SignInPage());
                },
                child: Text(
                  AppString.backToHomePage,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
