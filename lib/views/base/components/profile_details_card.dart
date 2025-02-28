import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utilities/app_colors.dart';

import '../../../utilities/app_constant.dart';

class ProfileDetailsCard extends StatelessWidget {
  final String riderName;
  final String tripLocation;
  final String dropOffLocation;
  final String vehicleType;
  final int personCount;
  final String email;
  final String phoneNumber;
  final String bookingDate;
  final String bookingTime;
  final double tripAmount;
  final double rating;
  final String status;
  final String imageUrl;
  final List<String> languages;

  const ProfileDetailsCard({
    super.key,
    required this.riderName,
    required this.tripLocation,
    required this.dropOffLocation,
    required this.vehicleType,
    required this.personCount,
    required this.email,
    required this.phoneNumber,
    required this.bookingDate,
    required this.bookingTime,
    required this.tripAmount,
    required this.rating,
    required this.status,
    required this.imageUrl,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 7.sp,
      child: Padding(
        padding: EdgeInsets.all(12.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rider Info
            Row(
              children: [
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
                // Rider Name and Rating
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.h,
                              horizontal: 16.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                            child: Text(
                              status,
                              style: Theme.of(context).textTheme.displaySmall!
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        riderName,
                        style:
                            Theme.of(context).textTheme.headlineMedium!
                                .copyWith(fontWeight: FontWeight.bold)!,
                      ),
                      Row(
                        children:
                            languages
                                .map(
                                  (language) => Container(
                                    margin: EdgeInsets.all(2.r),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4.h,
                                      horizontal: 12.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Text(
                                      language,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            ' $rating',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 16.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Status Button
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     padding: EdgeInsets.symmetric(
                //       vertical: 4.h,
                //       horizontal: 12.w,
                //     ),
                //     backgroundColor:
                //         status == "Pending" ? Colors.orange : Colors.green,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //   ),
                //   child: Text(status, style: TextStyle(color: Colors.white)),
                // ),
              ],
            ),
            SizedBox(height: 12.h),
            // Trip Details
            _buildDetailRow('Trip Location', tripLocation),
            _buildDetailRow('Drop Off Location', dropOffLocation),
            _buildDetailRow('Vehicles Type', vehicleType),
            _buildDetailRow('Person', '$personCount'),
            _buildDetailRow('Email', email),
            _buildDetailRow('Phone Number', phoneNumber),
            _buildDetailRow('Booking Date', bookingDate),
            _buildDetailRow('Booking Time', bookingTime),
            _buildDetailRow('Trip Amount', '\$$tripAmount'),

            // Languages
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8 .h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Label aligned to the left
          Container(
            constraints: BoxConstraints(minWidth: 150.w),
            child: Text(
              '$label :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ),

          // Value aligned to the right
          Text(value, textAlign: TextAlign.start),
        ],
      ),
    );
  }
}
