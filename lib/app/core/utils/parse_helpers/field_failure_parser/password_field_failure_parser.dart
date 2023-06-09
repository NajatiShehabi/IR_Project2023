import '../../failures/field_failure/password_field_failure.dart';

class PasswordFieldFailureParser {
  static String mapFieldFailureToErrorMessage({
    required PasswordFieldFailure failure,
  }) {
    switch (failure.error) {
      case PasswordError.empty:
        return ("Password should not be empty");
      case PasswordError.lengthError:
        return ("password should not be less than 8 characters");
      case PasswordError.oneNumber:
        return ("password should contains a number");
      case PasswordError.oneSpecialCharacter:
        return ("password should contains special character");
      case PasswordError.oneUpperCase:
        return ("password should contains at lease one upper case character");
      case PasswordError.oneLowerCase:
        return ("password should contains at lease one lower case character");
    }
  }
}
