import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/app_colors.dart';

class SettingComponents extends StatelessWidget {
  final Widget leading;
  final String bodyText;
  final Widget? endIcon;
  final VoidCallback? onTap;
  final bool supportPage;

  const SettingComponents({
    super.key,
    required this.leading,
    required this.bodyText,
    this.endIcon = const Icon(Icons.keyboard_arrow_right),
    this.onTap,
    this.supportPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.textFieldBorderColor),
        borderRadius:
        supportPage
            ? BorderRadius.circular(32.r) // Correct usage
            : BorderRadius.circular(16.r), // Correct usage
      ),
      leading: leading,
      title: Text(
        bodyText,
        style:
        supportPage
            ? Theme.of(context).textTheme.displayMedium
            : Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: endIcon,
      onTap: onTap,
    );
  }
}