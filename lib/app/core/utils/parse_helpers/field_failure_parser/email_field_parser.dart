
import '../../failures/field_failure/email_faild_failure.dart';

class EmailFieldFailureParser {
  static String mapFieldFailureToErrorMessage(
      {required EmailFieldFailure failure, }) {
    switch (failure.error) {
      case EmailError.empty:
        return ("Email Address should not be empty");
      case EmailError.notValid:
        return ("Email address is not valid");
    }
  }
}
