import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ir_project/app/core/theme/app_theme.dart';

abstract class BottomSheetWidget {
  static Widget chosePictureSheet(VoidCallback onGallery, VoidCallback onCamera,
      String? instructions, String? header) {
    return Container(
      height: 249,
      width: Get.size.width,
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (header != null) ...[
            Text(
              header,
              style: Get.textTheme.headlineMedium!
                  .copyWith(color: Get.theme.primaryColorDark),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15,),
          ],
          SizedBox(
            width: 200.w,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21.0),
                  ),
                ),

              ),
              onPressed: () async {
                Get.back();
                onCamera.call();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: AppTheme.grey.shade50,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Take a Picture',
                    style: Get.textTheme.bodyMedium!
                        .copyWith(color: AppTheme.grey.shade50),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: TextButton(
              onPressed: () async {
                Get.back();
                onGallery.call();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_outlined,
                    color: AppTheme.colorScheme.secondary,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Chose from Gallery',
                    style: Get.textTheme.bodyMedium!
                        .copyWith(color: AppTheme.colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ),
          if (instructions != null) ...[
            const SizedBox(
              height: 17.0,
            ),
            Text(
              instructions,
              style: Get.textTheme.labelSmall!
                  .copyWith(color: Get.theme.primaryColorDark),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
