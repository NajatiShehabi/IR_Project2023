abstract class NetworkRoutesControl {
  static const mainUrl = "http://192.168.43.214:5000";

  static const String api = '${mainUrl}api/';
  static const String user = '${api}Users/';
  static const String image =  'https://medi-order.herokuapp.com/';
}

abstract class ImagePaths {}

abstract class AppFonts {
  static const String alexandria = 'Alexandria';
}
abstract class AppLanguageKeys {
  static const String en = 'en';
  static const String ar = 'ar';
}

abstract class SvgPaths {}

abstract class DataConstant {
  static const int phoneNumberLength = 9;
  static const int dateOfBirthStartDate = 1930;
  static const int dateOfBirthEndDate = 2004;
  static const int otpLength = 4;
  static const int otpResendDuration = 4 * 60;
  static const double googleMapZoom = 15.151926040649414;
  static const double bearing = 192.8334901395799;
  static const double tilt = 0.440717697143555;
  static const int passwordLength = 8;
  static const double bottomNavigationBarHeight = 125.0;
}
