import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ir_project/app/core/widgets/custom_form_field.dart';
import 'package:ir_project/app/core/widgets/error_banner.dart';
import 'package:ir_project/app/core/widgets/loading_banner.dart';
import 'package:ir_project/app/core/widgets/rounded_button.dart';
import 'package:ir_project/app/data/service/services/validation_service.dart';

import '../controllers/search_controller.dart';
import '../document_card_widget.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Search Screen'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          controller: controller.scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  CustomFormField(
                    title: "Search Field",
                    controller: controller.textController,
                    hintText: "Enter your query",
                    validator: ValidationService.requiredFieldValidator,
                    autoValidate: controller.validateField,
                    prefixIcon: const Icon(Icons.search),
                    textInputAction: TextInputAction.search,
                    textInputType: TextInputType.text,
                    onChange: (value) {
                      if (value.length > 2) {
                        controller.getPrediction(value);
                        controller.getCorrection(value);
                      }
                    },
                    suffix: (controller.textController.text != '')
                        ? IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              controller.textController.text = '';
                              controller.predictionList = [];
                              controller.correctionValue = null;
                              controller.update();
                            },
                          )
                        : null,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  (controller.errorFailurePrediction != null)
                      ? ErrorBanner(
                          failure: controller.errorFailurePrediction!,
                          tryAgain: () => controller
                              .getPrediction(controller.textController.text),
                        )
                      : (controller.predictionList.isNotEmpty)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Prediction",
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ),
                                (controller.isLoadingPrediction)
                                    ? const LoadingBanner()
                                    : ListView.separated(
                                        controller: controller.scrollController,
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.predictionList.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              controller.setTextControllerValue(
                                                  controller
                                                      .predictionList[index]);
                                              controller.getPrediction(
                                                  controller
                                                      .textController.text);
                                              controller.getCorrection(
                                                  controller
                                                      .textController.text);
                                            },
                                            child: ListTile(
                                              title: Text(
                                                controller
                                                    .predictionList[index],
                                                style: context
                                                    .textTheme.headlineLarge!
                                                    .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                Container(
                                          width: Get.width,
                                          height: 3,
                                          color: Colors.grey,
                                        ),
                                      ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            )
                          : const SizedBox(),
                  (controller.errorFailureCorrection != null)
                      ? ErrorBanner(
                          failure: controller.errorFailureCorrection!,
                          tryAgain: () => controller
                              .getCorrection(controller.textController.text),
                        )
                      : ((controller.correctionValue ?? "").isNotEmpty)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Correction Word",
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ),
                                (controller.isLoadingCorrection)
                                    ? const LoadingBanner()
                                    : InkWell(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Text(
                                                  controller.correctionValue ??
                                                      ''),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          controller.setTextControllerValue(
                                              controller.correctionValue ?? '');
                                          controller.getPrediction(
                                              controller.textController.text);
                                          controller.getCorrection(
                                              controller.textController.text);
                                        },
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          : const SizedBox(),
                  (controller.isLoading)
                      ? const LoadingBanner()
                      : RoundedButton(
                          text: "Search",
                          press: () {
                            controller.submit();
                            //Get.toNamed(Routes.HOME);
                          },
                        ),
                  if (controller.errorFailure != null)
                    ErrorBanner(
                      failure: controller.errorFailure!,
                      tryAgain: () => controller.submit(),
                    ),
                  if (controller.mapEntries.isNotEmpty &&
                      controller.errorFailure == null)
                    ListView.builder(
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      itemCount: controller.mapEntries.length,
                      itemBuilder: (context, index) {
                        return DocumentCardWidget(
                          title: controller.mapEntries[index].key,
                          body: controller.mapEntries[index].value,
                        );
                      },
                    )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
