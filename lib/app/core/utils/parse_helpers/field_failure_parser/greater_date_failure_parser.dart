
import '../../failures/field_failure/greater_date_failure.dart';

class GreaterDateFailureParser {
  static String mapFieldFailureToErrorMessage({
    required GreaterDateFailure failure,
  }) {
    switch (failure.error) {
      case GreaterDateError.empty:
        return ("this field is required");
      case GreaterDateError.notValid:
        return ("this date should be grater than start date");
    }
  }
}
