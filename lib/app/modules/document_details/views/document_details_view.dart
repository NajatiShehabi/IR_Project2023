import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/document_details_controller.dart';

class DocumentDetailsView extends GetView<DocumentDetailsController> {
  const DocumentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentDetailsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.content,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    });
  }
}
