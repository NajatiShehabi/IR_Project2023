import 'package:get/get.dart';
import 'package:ir_project/app/core/utils/failures/failures.dart';
import 'package:ir_project/app/core/utils/helpers/helper.dart';

abstract class ErrorHandler {
  static Future handleError(Failure failure) async {
    String message = '';
    if (failure is CustomFailure) {
      message = failure.message;
    } else if (failure is TimeOutFailure) {
      message = "Timeout Please try again";
    } else if (failure is NoInternetConnection) {
      message = "No Internet Connection, try again later";
    } else if (failure is UnauthorizedFailure) {
      message = failure.message ?? "Something went wrong!, try again";
    } else {
      message = "Something went wrong!, try again";
    }
    return await DialogHelper.showErrorDialog(
        Get.overlayContext ?? Get.context!, message);
  }

  static String extractErrorMessageFromFailure(Failure failure) {
    if (failure is CustomFailure) {
      return failure.message;
    } else if (failure is TimeOutFailure) {
      return "Timeout Please try again";
    } else if (failure is NoInternetConnection) {
      return "No Internet Connection, try again later";
    } else if (failure is UnauthorizedFailure) {
      return failure.message ?? "Something went wrong!, try again";
    } else {
      return "Something went wrong!, try again";
    }
  }
}
// class ErrorHandler {
//   void listenForErrors() {
//     Get.find<HttpHelper>().listenForErrors().listen(
//       (httpFailure) {
//         if (httpFailure is UnauthorizedFailure) {
//           Get.showSnackbar(
//             const GetSnackBar(
//               message: 'You are not Authenticated',
//             ),
//           );
//           Get.find<AuthRepository>().logoutUser();
//         }
//       },
//     );
//   }
// }
