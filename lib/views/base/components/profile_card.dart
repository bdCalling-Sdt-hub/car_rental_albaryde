import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';

import '../../../utilities/app_constant.dart';

class ProfileCard extends StatelessWidget {
  final String riderName;
  final String destination;
  final String bookingDate;
  final String rating;
  final String status;
  final String imageUrl;

  const ProfileCard({
    super.key,
    required this.riderName,
    required this.destination,
    required this.bookingDate,
    required this.rating,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: AppColors.black),
      ),

      child: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rider Image
            // CircleAvatar(radius: 30.r, backgroundImage: NetworkImage(imageUrl)),
            Container(
              width: 60.w,
              height: 70.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // This makes the container round
                // border: Border.all(
                //   color: AppColors.primaryColor, // Border color
                //   width: 2.w, // Border width
                // ),
              ),
              child: ClipOval(
                child: Image.network(
                  AppConstant.placeHolderImageUrl,
                  fit:
                      BoxFit
                          .fill, // This ensures the image fills the circle while preserving aspect ratio
                ),
              ),
            ),
            SizedBox(width: 10.w),
            // Rider Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rider Name and Rating
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: AppString.riderName,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            TextSpan(
                              text: riderName,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: rating,
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(fontSize: 14.sp),
                            ),

                            WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                                size: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),

                  // Destination and Booking Date
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Destination : ',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        TextSpan(
                          text: destination,
                          style:
                              Theme.of(context)
                                  .textTheme
                                  .headlineMedium, // Customize destination text
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Booking Date: ',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        TextSpan(
                          text: bookingDate,
                          style:
                              Theme.of(
                                context,
                              ).textTheme.headlineMedium, // Customize date text
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 12.w,
                        ),
                        // TODO : change the color according to the status
                        backgroundColor:
                            status == "Pending"
                                ? AppColors.primaryColor
                                : AppColors .grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                      child: Text(
                        "Pending....",
                        style: Theme.of(context).textTheme.displayMedium!
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Status Button
          ],
        ),
      ),
    );
  }
}
