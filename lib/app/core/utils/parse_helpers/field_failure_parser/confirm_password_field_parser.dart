



import 'package:ir_project/app/core/utils/failures/field_failure/confirm_password_field_failure.dart';

class ConfirmPasswordFieldFailureParser {
  static String mapFieldFailureToErrorMessage(
      {required ConfirmPasswordFieldFailure failure, }) {

    switch (failure.error) {
      case ConfirmPasswordFieldError.empty:
        return "this field is required";
      case ConfirmPasswordFieldError.passwordDoNotMatch:
        return  "this date should be grater than start date";
    }
  }
}
