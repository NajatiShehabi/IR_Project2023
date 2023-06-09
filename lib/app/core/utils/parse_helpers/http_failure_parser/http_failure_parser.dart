import '../../failures/http_failure.dart';

class HttpFailureParser {
  static String mapHttpFailureToErrorMessage(
    HttpFailure failure,
  ) {
    if (failure is NoInternetConnection) {
      return ("There is no internet Connection");
    } else if (failure is UnauthorizedFailure) {
      return ("You need to sign up first");
    } else if (failure is ServerFailure) {
      return ("There is error in the server");
    } else if (failure is TimeOutFailure) {
      return ("request time out, no server response");
    } else if (failure is UnexpectedResponseFailure) {
      return ("Something went Wrong, Unexpected Response!");
    } else if (failure is CustomFailure) {
      return failure.message;
    } else {
      return ("Some Thing Went Wrong!");
    }
  }
}
