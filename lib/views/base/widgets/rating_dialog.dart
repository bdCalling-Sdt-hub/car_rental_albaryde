import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_icons.dart';
import '../../../utilities/app_strings.dart';
import '../components/network_svg_image .dart';

class RatingDialog extends StatefulWidget {
  final String ratingMessage;
  final ValueChanged<double> onRatingSubmitted; // Callback to return the rating

  RatingDialog({
    required this.ratingMessage,
    required this.onRatingSubmitted, // Initialize the callback
  });

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double _rating = 5; // Default rating

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NetworkSvgImage(
            assetName: AppIcons.checkMark,
            width: 100.w,
            height: 100.h,
          ),
          SizedBox(height: 10.h),
          Text(
            widget.ratingMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          // Profile Picture
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Rating Bar
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 35,
            itemBuilder: (context, index) {
              return Icon(Icons.star, color: AppColors.primaryColor);
            },
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating; // Store the updated rating
              });
            },
          ),
          SizedBox(height: 20.h),
          // Buttons: Not Now and Submit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: BorderSide(
                        color: AppColors.black.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    AppString.notNow,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: BorderSide(
                        color: AppColors.black.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                    widget.onRatingSubmitted(
                      _rating,
                    ); // Pass the rating back to the callback
                  },
                  child: Text(
                    AppString.submit,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showRatingDialog(
    BuildContext context,
    String ratingMessage,
    ValueChanged<double> onRatingSubmitted,
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RatingDialog(
        ratingMessage: ratingMessage,
        onRatingSubmitted: onRatingSubmitted, // Pass the callback function
      );
    },
  );
  /// ======================> example calling the dialog
  // showRatingDialog(
  //   context,
  //   'https://via.placeholder.com/150', // Profile image URL
  //   'Give a Driver Rating...', // Rating message
  //       (rating) {
  //     print(
  //       "User rated: $rating",
  //     ); // Handle the rating here (e.g., save it or send to API)
  //   },
  // );
}
