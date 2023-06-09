import 'package:get/get.dart';

class DocumentDetailsController extends GetxController {
  late String title;
  late String content;

  @override
  void onInit() {
    try{
      title = Get.parameters['title']!;
      content = Get.parameters['content']!;
    }
    catch(_){
      Get.back();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
