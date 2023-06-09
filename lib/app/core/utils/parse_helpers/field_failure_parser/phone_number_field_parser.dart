import '../../failures/field_failure/phone_number_field_failure.dart';

class PhoneNumberFieldFailureParser {
  static String mapFieldFailureToErrorMessage({
    required PhoneNumberFieldFailure failure,
  }) {
    switch (failure.error) {
      case PhoneNumberError.empty:
        return ("Phone number is required");
      case PhoneNumberError.notValid:
        return ("Please enter valid phone number");
    }
  }
}
