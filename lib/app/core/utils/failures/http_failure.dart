

import 'base_failure.dart';

abstract class HttpFailure extends Failure {
  const HttpFailure();
}

class ServerFailure extends HttpFailure {
  const ServerFailure();
}

class CustomFailure extends HttpFailure {
  final String message;

  const CustomFailure({required this.message});
}

class UnauthorizedFailure extends HttpFailure {
   UnauthorizedFailure({this.message = "Unauthorized Failure"});
  String message;
}

class NoInternetConnection extends HttpFailure {
  const NoInternetConnection();
}

class TimeOutFailure extends HttpFailure {
  const TimeOutFailure();
}

class NotVerifiedFailure extends HttpFailure {
  const NotVerifiedFailure();
}
class CancelRequestFailure extends HttpFailure {
  const CancelRequestFailure();
}
class UnknownFailure extends HttpFailure {
  const UnknownFailure();
}

class UnexpectedResponseFailure  extends HttpFailure{
  const  UnexpectedResponseFailure();
}


class BadRequestFailure extends HttpFailure {
  const BadRequestFailure(this.message);
  final String message;
}

