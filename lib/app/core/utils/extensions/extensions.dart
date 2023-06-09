


extension DoubleMethods on double {
  double roundTo2DigitsAfterDecimalPoint() => double.parse(toStringAsFixed(2));
}

extension StringMethods on String {
  bool get isValidEmail => contains(RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'));



  String get numberSplit =>
      '${substring(0, 2)} ${substring(2, 5)} ${substring(5)}';
}


extension DurationEx on Duration {
  String toMinuteWithSeconds() {
    int seconds = inSeconds;
    int minutes = seconds ~/ 60;
    String ret = minutes < 10 ? '0$minutes' : '$minutes';
    ret += ':';
    seconds -= minutes * 60;
    ret += seconds < 10 ? '0$seconds' : '$seconds';
    return ret;
  }
}