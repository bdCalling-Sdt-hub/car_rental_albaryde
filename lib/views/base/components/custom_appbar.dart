import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  final String appBarHeadingText;

  const CustomAppbar({super.key, required this.appBarHeadingText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(CupertinoIcons.back),
        ),
        Expanded(
          child: Text(
            appBarHeadingText,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: 48.w ), // Adds space to balance the back button width
      ],
    );
  }
}
