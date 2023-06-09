import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ir_project/app/core/widgets/custom_form_field.dart';
import 'package:ir_project/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("IR Search"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Image.asset(
                      "assets/images/unstructured_vs_structured_data.png"),
                ),
                Text(
                  "Information retrieval is the process of accessing data resources. Usually documents or other unstructured data for the purpose of sharing knowledge. More specifically, information retrieval systems provide the interface between users and large data repositories – especially textual repositories.",
                  style: context.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade300),
                          width: Get.width / 1.2,
                          height: Get.width / 2.2,
                          child: Center(
                              child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(Icons.search),
                              ),
                              Text(
                                "Search",
                                style: context.textTheme.headlineMedium,
                              ),
                            ],
                          )),
                        ),
                        onTap: () {
                          Get.toNamed(Routes.SEARCH);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
