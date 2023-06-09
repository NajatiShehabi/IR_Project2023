import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ir_project/app/core/utils/failures/base_failure.dart';
import 'package:ir_project/app/core/utils/parse_helpers/failure_parser.dart';


class ErrorPanel extends StatelessWidget {
  final Failure failure;
  final void Function()? onTryAgain;

  const ErrorPanel({Key? key, required this.failure, this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_rounded,
              color: Colors.red.shade300,
              size: 80.w,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Text(
                FailureParser.mapFailureToString(failure: failure, context: context),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red.shade300),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            if (onTryAgain != null)
              InkWell(
                onTap: onTryAgain,
                child: Container(
                  width: 180.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), color: Colors.red.shade200),
                  child: Center(
                    child: Text(
                      "Try again",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
