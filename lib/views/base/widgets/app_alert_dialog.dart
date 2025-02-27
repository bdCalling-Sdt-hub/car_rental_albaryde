import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utilities/app_colors.dart';

import '../../../utilities/app_strings.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String noButtonText;
  final String yesButtonText;
  final Color buttonColor;

  const AppAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.noButtonText = AppString.yes,
    this.yesButtonText = AppString.no,
    this.buttonColor = Colors.pink, // Default color is pink
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColors.white,
      // Assuming AppColors.white is just white
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      content: Text(content, style: Theme.of(context).textTheme.displayMedium),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          child: Text(
            noButtonText,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Implement logout functionality here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            yesButtonText,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
