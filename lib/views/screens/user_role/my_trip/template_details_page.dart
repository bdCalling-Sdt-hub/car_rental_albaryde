import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';


import '../../../base/components/profile_details_card.dart';

/// Pending Details Page , Cancelled Details Page , Completed details Page
class DetailsTemplatePage extends StatelessWidget {
  final String appBarText;
  final ProfileDetailsCard profileDetailsCard;

  const DetailsTemplatePage({
    super.key,
    required this.appBarText,
    required this.profileDetailsCard,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          child: Column(
            children: [
              CustomAppbar(appBarHeadingText: appBarText),
              profileDetailsCard,
            ],
          ),
        ),
      ),
    );
  }
}
