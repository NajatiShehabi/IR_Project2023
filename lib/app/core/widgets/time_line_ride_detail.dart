/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
enum Status { isDone, isCurrent, isNotDone }



const Color fontColorConst = Color(0xff42526E);
const Color circleColor = Color(0xffb00f0f);
const Color fontGreyColorConst = Colors.grey;
const FontWeight gilroySemiBold =FontWeight.bold;
const FontWeight geSsMedium =FontWeight.normal;

class TimeLineWidget extends StatelessWidget {
  final String taskString;
  final Status status;
  final bool isFirst;
  final bool isLast;
  final String dateOfEnd;
  final bool isHistoricRideLast;


  const TimeLineWidget({
    Key? key,
    required this.taskString,
    required this.status,
    this.isFirst = false,
    this.isLast = false,
    this.dateOfEnd = "24/02/2022, 11:00 AM",
    this.isHistoricRideLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TimelineTile(
        endChild: Padding(
          padding: const EdgeInsets.only(left: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskString,
                style: TextStyle(
                  fontSize: (status == Status.isCurrent) ? 16.sp : 15.sp,
                  fontWeight: (status == Status.isCurrent)
                      ? gilroySemiBold
                      : geSsMedium,
                  color: (status == Status.isCurrent)
                      ? circleColor
                      : (status == Status.isDone)
                          ? fontColorConst
                          : Colors.grey,
                ),
              ),
              */
/*(status == Status.isDone || isHistoricRideLast)
                  ? Text(
                      dateOfEnd,
                      style: const TextStyle(
                        color: fontGreyColorConst,
                      ),
                    )
                  : const SizedBox(),*//*

            ],
          ),
        ),
        indicatorStyle: IndicatorStyle(
          width: 14,
          height: 14,
          indicator: (status == Status.isDone)
              ? Stack(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                          color: circleColor, shape: BoxShape.circle),
                    ),
                    Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Get.theme.colorScheme.primary, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                )
              : (status == Status.isCurrent)
                  ? Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                          color: circleColor, shape: BoxShape.circle),
                    )
                  : Stack(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          decoration: const BoxDecoration(
                              color: fontGreyColorConst, shape: BoxShape.circle),
                        ),
                        Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Get.theme.colorScheme.onPrimary, shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
        ),
        afterLineStyle: LineStyle(
          thickness: 2,
          color: (status == Status.isCurrent)
              ? fontGreyColorConst
              : (status == Status.isDone)
                  ? circleColor
                  : fontGreyColorConst,
        ),
        beforeLineStyle: LineStyle(
            thickness: 2,
            color: (status == Status.isCurrent)
                ? fontGreyColorConst
                : (status == Status.isDone)
                    ? circleColor
                    : fontGreyColorConst),
        isFirst: isFirst,
        isLast: isLast,
      ),
      height: 29,
    );
  }
}
*/
