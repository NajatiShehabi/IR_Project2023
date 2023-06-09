import 'package:get/get.dart';

import '../controllers/document_details_controller.dart';

class DocumentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentDetailsController>(
      () => DocumentDetailsController(),
    );
  }
}
