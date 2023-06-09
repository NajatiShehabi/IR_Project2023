
import '../../failures/field_failure/required_field_number_failure.dart';

class NumberFieldFailureParser {
  static String mapFieldFailureToErrorMessage(
      {required NumberFieldFailure failure,}) {
    switch (failure.error) {
      case NumberFieldError.empty:
        return ("this field is required");
      case NumberFieldError.notValid:
        return "Number Invalid";
    }
  }
}
