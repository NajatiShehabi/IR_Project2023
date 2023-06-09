import '../../failures/field_failure/otp_field_failure.dart';

class OtpFieldFailureParser {
  static String mapFieldFailureToErrorMessage({
    required OtpFieldFailure failure,
  }) {
    switch (failure.error) {
      case OtpFieldError.empty:
        return ("Otp code should not be empty");
      case OtpFieldError.otpLessThanNumber:
        return ("Otp code should not be less than 6");
    }
  }
}
