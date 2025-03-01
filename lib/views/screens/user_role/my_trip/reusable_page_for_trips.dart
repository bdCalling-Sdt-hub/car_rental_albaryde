import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_asset_path.dart';
import 'package:untitled/utilities/app_constant.dart';
import 'package:untitled/utilities/app_icons.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';


import '../../../../controller/trip_button_controller.dart';
import '../../../../utilities/app_colors.dart';
import '../../../base/components/profile_card.dart';
import '../../../base/components/profile_details_card.dart';
import '../../../base/widgets/app_alert_dialog.dart';


import '../../../base/widgets/rating_dialog.dart';
//My Trip Empty file , My Trip Page (1, 2 ,3 ,4 )  ,

class MyTripReusableScreen extends StatelessWidget {
  const MyTripReusableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar(appBarHeadingText: AppString.myTrip),
              ScrollableButtonRow(),
              ProfileCard(
                riderName: 'sdsdsd',
                destination: 'sdds',
                bookingDate: 'sdsd',
                rating: '2.0',
                status: 'sdsdds',
                imageUrl: AppConstant.placeHolderImageUrl,
              ),
              ProfileDetailsCard(
                riderName: "Bashar Islam",
                tripLocation: "Dhaka City",
                dropOffLocation: "Rampura",
                vehicleType: "Bike",
                personCount: 1,
                email: "info@gamil.com",
                phoneNumber: "55599922",
                bookingDate: "12 Jan 2025",
                bookingTime: "08:00 AM",
                tripAmount: 20.0,
                rating: 4.9,
                status: "Pending",
                imageUrl: "https://via.placeholder.com/150",
                languages: ["Italian", "French"],
              ),
              ElevatedButton(
                onPressed: () {
                  showRatingDialog(
                    context,
                    AppString.giveADriverRating, // Rating message
                    (rating) {
                      print(
                        "User rated: $rating",
                      ); // Handle the rating here (e.g., save it or send to API)
                    },
                  );
                },
                child: Text(
                  "click",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollableButtonRow extends StatelessWidget {
  final ButtonController controller =
      Get.find<ButtonController>(); // Initialize GetX controller

  @override
  Widget build(BuildContext context) {
    // Fetch the button list (simulate API call for button list)
    controller.fetchButtonList();

    return Column(
      children: [
        // Scrollable Row with buttons
        Container(
          height: 50, // Adjust the height as needed
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: GetBuilder<ButtonController>(
            builder: (controller) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.buttonList.length,
                itemBuilder: (context, index) {
                  String buttonText = controller.buttonList[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8.0.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),

                          side: BorderSide(
                            color: AppColors.black.withValues(alpha: 0.5),
                          ),
                        ),
                        backgroundColor:
                            controller.selectedButton == buttonText
                                ? Colors.orange
                                : Colors.white,
                      ),
                      onPressed: () {
                        // Update the selected button when clicked
                        controller.updateSelectedButton(buttonText);

                        ///TODO: fetch the URL based content
                        // controller.fetchContentForButton(buttonText,apiUrl);
                      },
                      child: Text(
                        buttonText,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        // Display the content based on the selected button
        GetBuilder<ButtonController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Text(
                controller.content, // Content comes from the API
              ),
            );
          },
        ),
      ],
    );
  }
}

