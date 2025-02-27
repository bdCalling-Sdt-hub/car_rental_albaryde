import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadPhotoDialog extends StatefulWidget {
  const UploadPhotoDialog({super.key});

  @override
  _UploadPhotoDialogState createState() => _UploadPhotoDialogState();
}

class _UploadPhotoDialogState extends State<UploadPhotoDialog> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppString.uploadYourPhoto,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: _pickImage,
              child: DottedBorder(
                borderType: BorderType.RRect,
               radius:  Radius.circular(10.r),
                dashPattern: [8, 4],
                color: AppColors.primaryColor,
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: AppColors.textFieldShade,
                    borderRadius: BorderRadius.circular(10.r),
                    // border: Border.all(color: AppColors.primaryColor),
                  ),
                  child:
                      _image == null
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_upload_outlined,
                                size: 40,
                                color: AppColors.black,
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                AppString.dropFileOrBrowse,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium!.copyWith(
                                  color: AppColors.grey.withValues(alpha: 0.7),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                AppString.photoFormatText,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium!.copyWith(
                                  color: AppColors.grey.withValues(alpha: 0.4),
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              SizedBox(
                                width: 150.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                      side: BorderSide(
                                        color: AppColors.black.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: _pickImage,
                                  child: Text(
                                    AppString.browseFiles,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.file(_image!, fit: BoxFit.cover),
                          ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      side: BorderSide(
                        color: AppColors.grey.withValues(alpha: 0.2),
                        width: 0.2,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 20.w,
                    ),
                    backgroundColor: AppColors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    AppString.cancel,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 20.w,
                    ),
                  ),
                  onPressed: () {
                    // TODO: upload logic
                  },
                  child: Text(
                    AppString.done,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showUploadPhotoDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => UploadPhotoDialog());
}
