import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_asset_path.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_icons.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_appbar.dart';
import 'package:untitled/views/base/components/network_svg_image%20.dart';

// =============================================== Controller  ===============>
class RideController extends GetxController {
  String pickupLocation = "";
  String dropOffLocation = "";
  final List<Map<String, String>> destinations = [
    {
      "name": "Select Citywalk Mall",
      "address": "Saket District Center, District Center, Sector 6",
    },
    {
      "name": "Select Citywalk Mall",
      "address": "Saket District Center, District Center, Sector 6",
    },
    {
      "name": "Select Citywalk Mall",
      "address": "Saket District Center, District Center, Sector 6",
    },
    {
      "name": "Select Citywalk Mall",
      "address": "Saket District Center, District Center, Sector 6",
    },
  ];

  void updatePickupLocation(String value) {
    pickupLocation = value;
    update(); // Manually trigger the UI update
  }

  void updateDropOffLocation(String value) {
    dropOffLocation = value;
    update(); // Manually trigger the UI update
  }

  void selectDestination(String destination) {
    dropOffLocation = destination;
    update(); // Manually trigger the UI update
  }
}

// ================================================   UI ===============>
class PlanRideScreen extends StatelessWidget {
  final RideController controller = Get.put(
    RideController(),
  ); // GetX controller initialization
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropOffController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize controllers with current location values
    _pickupController.text = controller.pickupLocation;
    _dropOffController.text = controller.dropOffLocation;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom AppBar
              CustomAppbar(appBarHeadingText: AppString.planYourRide),

              // Main content
              Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 160.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: AppColors.grey),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w,
                          vertical: 6.h,
                        ),
                        child: Row(
                          children: [
                            //ICON ============>
                            NetworkSvgImage(
                              assetName: AppIcons.mapSearchField,
                              width: 20.w,
                              height: 101.h,
                            ),
                            SizedBox(width: 10.w),

                            // Space between image and text form field
                            Expanded(
                              child: Column(
                                children: [
                                  //==========================================================Pickup field
                                  SizedBox(height: 5.w),
                                  GetBuilder<RideController>(
                                    builder: (context) {
                                      return TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: AppString.pickUP,
                                        ),
                                        controller: _pickupController,
                                        onChanged: (value) {
                                          controller.updatePickupLocation(
                                            value,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Row(
                                    children: [
                                      // need a thin line here
                                      SizedBox(
                                        width: 260.w,
                                        child: Divider(
                                          thickness: 1.r,
                                          color: AppColors.grey,
                                          height: 12.h,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      NetworkSvgImage(
                                        assetName: AppIcons.swapIcon,
                                        height: 26.h,
                                        width: 26.w,
                                      ),
                                    ],
                                  ),
                                  //=================================================Destination filed
                                  GetBuilder<RideController>(
                                    builder: (context) {
                                      return TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: AppString.dropOff,
                                        ),
                                        controller: _dropOffController,
                                        onChanged: (value) {
                                          controller.updateDropOffLocation(
                                            value,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ================================================> List of suggested  destinations
                    GetBuilder<RideController>(
                      builder: (_) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.destinations.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 32.h, // Customize the size as needed
                                width: 32.h, // Same size as height for a circle
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  // Background color of the circle
                                  shape:
                                      BoxShape
                                          .circle, // Make the container circular
                                ),
                                child: Icon(
                                  Icons.location_on_rounded, // Pin icon
                                  color: Colors.white, // Pin icon color
                                  size: 22.h, // Size of the icon
                                ),
                              ),
                              title: Text(
                                controller.destinations[index]["name"] ?? '',
                              ),
                              subtitle: Text(
                                controller.destinations[index]["address"] ?? '',
                              ),
                              onTap: () {
                                controller.selectDestination(
                                  controller.destinations[index]["name"] ??
                                      'null found here',
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                           SizedBox(height: 20.h),

                    // Submit Button
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to create the dashed line
}
