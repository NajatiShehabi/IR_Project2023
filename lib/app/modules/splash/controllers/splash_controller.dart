import 'dart:developer';
import 'package:get/get.dart';
import 'package:ir_project/app/core/utils/helpers/http_helper.dart';
import 'package:ir_project/app/core/utils/helpers/local_storage_helper.dart';
import 'package:ir_project/app/data/provider/api_provider/auth_provider.dart';
import 'package:ir_project/app/data/provider/storage_provider/local_auth_provider.dart';
import 'package:ir_project/app/data/service/services/repository/auth_reposiory.dart';
import 'package:ir_project/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  Duration splashDelay = const Duration(seconds: 3);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    init();
    super.onReady();
  }

  Future<void> doDelays() async {
    await Future.delayed(splashDelay);
  }

  Future<void> init() async {
    Get.put(LocalStorageHelper(await SharedPreferences.getInstance()),
        permanent: true);
    Get.put<HttpHelper>(HttpHelper(), permanent: true);
    Get.put<AuthProvider>(AuthProvider(), permanent: true);
    Get.put(LocalAuthProvider(), permanent: true);
    Get.put<AuthRepository>(
        AuthRepository(apiProvider: Get.find(), localAuthProvider: Get.find()),
        permanent: true);
    await doDelays();
    Get.toNamed(Routes.HOME);
    update();
  }
  @override
  void onClose() {}
}
