import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function? press;
  final Color? color, textColor;
  final double textSize;

  const RoundedButton({
    required this.text,
    required this.press,
    this.textColor = Colors.white,
    this.color,
    this.textSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h, top: 8.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            backgroundColor: color ?? Get.theme.colorScheme.secondary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0))),
        onPressed: (press != null) ? () => press!() : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: textSize),
            ),
          ],
        ),
      ),
    );
  }
}
