/*
import 'package:get/get.dart';
import 'package:ir_project/app/data/service/services/repository/auth_reposiory.dart';
import 'package:ir_project/app/routes/app_pages.dart';

class AuthHandler {
  void listenForAuthState() {
    AuthRepository authRepository = Get.find<AuthRepository>();
    authRepository.getAuthState().listen((authState) async {
      switch (authState) {
        case AuthenticationState.unknown:
          Get.offAllNamed(Routes.HOME);
          break;
        case AuthenticationState.unauthenticated:
          Get.offAllNamed(Routes.HOME);
          break;
        case AuthenticationState.authenticated:
          {
              Get.offAllNamed(Routes.HOME);
            break;
          }
        case AuthenticationState.firstTime:
          Get.offAllNamed(Routes.HOME);
          break;
      }
    });
  }
}
*/
