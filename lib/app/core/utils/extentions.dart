
import 'package:flutter/material.dart';
import 'package:ir_project/app/core/utils/parse_helpers/failure_parser.dart';
import 'package:ir_project/app/core/utils/parse_helpers/field_failure_parser/field_failure_parser.dart';

import 'failures/base_failure.dart';
import 'failures/field_failure/field_failure.dart';

extension ContextMethods on BuildContext {
  /// Parse General Failure To String Message
  String failureParser(Failure failure) =>
      FailureParser.mapFailureToString(failure: failure, context: this);

  /// Parse Field Failure To String Message or Return null if failure null
  String? fieldFailureParser(FieldFailure? failure) => failure == null
      ? null
      : FieldFailureParser.mapFieldFailureToErrorMessage(
          failure: failure,
        );

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

/*
  bool get isAuth => Get.find<AuthProvider>(). getAuthState();*/


  bool get isTablet => MediaQuery.of(this).size.width > 768;
}

extension DoubleMethods on double {
  double roundTo2DigitsAfterDecimalPoint() => double.parse(toStringAsFixed(2));
}

extension StringMethods on String {
  bool get isValidEmail => contains(RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'));
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


extension InverseKeyValue on Map {
  Map<K, V> inverse<K, V>() {
    return map((k, v) => MapEntry(v, k));
  }
}
