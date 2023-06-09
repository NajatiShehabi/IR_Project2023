import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:ir_project/app/core/widgets/bottom_sheet_widgets.dart';

abstract class Helper {
  static Future<Uint8List> getBytesFromAsset(
      {required String path, required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }
}

abstract class DialogHelper {
  static Future<void> showErrorDialog(BuildContext context, String errorMessage) async {
    return await (AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        headerAnimationLoop: false,
        body: Column(
          children: [
            Text(
              errorMessage,
              softWrap: true,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium!
                  .copyWith(color: Get.theme.colorScheme.error),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )).show());
  }

  static Future<void> confirmDialog(BuildContext context, String confirmText, VoidCallback? onConfirm) async {
    return await (AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        headerAnimationLoop: false,
        body: Column(
          children: [
            Text(
              confirmText,
              softWrap: true,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium!,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                onConfirm?.call();
              },
              child: const Text('OK'),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )).show());
  }
}

abstract class BottomSheetHelper {
  static Future showPickPhotoBottomSheet({required VoidCallback onGallery, required VoidCallback onCamera, String? instructions, String? header}) async {
    return await Get.bottomSheet(
      BottomSheetWidget.chosePictureSheet(onGallery, onCamera, instructions, header),
      elevation: 20,
      backgroundColor: Colors.transparent,
    );
  }
}
