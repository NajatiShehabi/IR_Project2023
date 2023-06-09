class _AppInformationKeys {
  static const firstTime = "first_time";
  static const firstTimeLoggedIn = "first_time_logged_in";
}

class AppInformationModel {
  bool firstTime;
  bool firstTimeLoggedIn;

  AppInformationModel(
      {required this.firstTime, required this.firstTimeLoggedIn});

  factory AppInformationModel.fromJson(Map<String, dynamic> json) {
    return AppInformationModel(
      firstTime:
      json[_AppInformationKeys.firstTime].toString().toLowerCase() == "true"
          ? true
          : false,
      firstTimeLoggedIn:
      json[_AppInformationKeys.firstTimeLoggedIn].toString() == 'true'
          ? true
          : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _AppInformationKeys.firstTime: firstTime.toString(),
      _AppInformationKeys.firstTimeLoggedIn: firstTimeLoggedIn.toString(),
    };
  }
}
