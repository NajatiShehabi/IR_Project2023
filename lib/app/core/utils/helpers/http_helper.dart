import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ir_project/app/core/utils/failures/failures.dart';
import 'package:ir_project/app/data/model/base_response.dart';

class HttpHelper {
  HttpHelper();

  late final StreamController<HttpFailure> errorStreamController =
      StreamController<HttpFailure>();

  Stream<HttpFailure> listenForErrors() {
    return errorStreamController.stream;
  }

  Future<BaseResponse<T>> get<T>(
    String url, {
    T Function(dynamic json)? decoder,
    Map<String, String>? headers = HttpHelper.basicHeader,
    Map<String, dynamic>? params,
  }) async {
    try {
      log('request for $url');
      log('with headers $headers');
      log('with Params $params');
      final response = await http
          .get(Uri.parse(_getUrlWithParams(url, params)), headers: headers)
          .timeout(
            const Duration(seconds: 60),
          );
      final ret = _responseHandler<T>(response, decoder);
      log('response from $url with status code ${response.statusCode}');
      log('with Data ${ret.toString()}');
      return ret;
    } on SocketException catch (_) {
      HttpFailure failure = const NoInternetConnection();
      errorStreamController.add(failure);
      throw failure;
    }
  }

  Future<BaseResponse<T>> post<T>(
    String url, {
    Map<String, dynamic>? body,
    T Function(dynamic json)? decoder,
    Map<String, String>? headers = HttpHelper.basicHeader,
    Map<String, dynamic>? params,
  }) async {
    try {
      log('request for  ${_getUrlWithParams(url, params)}');
      log('with headers $headers');
      log('with Params $params');
      log('with body  $body');
      final response = await http
          .post(
            Uri.parse(_getUrlWithParams(url, params)),
            headers: headers,
            body: body == null ? null : jsonEncode(body),
          )
          .timeout(
            const Duration(seconds: 60),
          );
      final ret = _responseHandler<T>(response, decoder);
      log('response from $url with status code ${response.statusCode}');
      log('with Data ${ret.toString()}');
      return ret;
    } on SocketException catch (_) {
      HttpFailure failure = const NoInternetConnection();
      errorStreamController.add(failure);
      throw failure;
    } on TimeoutException catch (_) {
      HttpFailure failure = const TimeOutFailure();
      errorStreamController.add(failure);
      throw failure;
    } catch (e) {
      rethrow;
    }
  }

  String _getUrlWithParams(String url, Map<String, dynamic>? params) {
    if (params != null) {
      url += '?';
      final listOfParam = params.entries.toList();
      for (int i = 0; i < listOfParam.length; i++) {
        url += '${listOfParam[i].key}=${listOfParam[i].value.toString()}';
        if (i + 1 < listOfParam.length) {
          url += '&';
        }
      }
    }
    return url;
  }

  BaseResponse<T> _responseHandler<T>(
      http.Response response, T Function(dynamic json)? decoder) {
    // int statusCode = getStatusCode(response);
    int statusCode = response.statusCode;
    log("Status Code: ${response.statusCode}");
    log("body ${response.body}");
    HttpFailure failure;
    try {
      BaseResponse<T> baseResponse =
          BaseResponse.fromJson(jsonDecode(response.body), decoder);

      if (statusCode >= 200 && statusCode < 300) {
        return baseResponse;
      } else if (statusCode == HttpStatus.unauthorized ||
          statusCode == HttpStatus.forbidden) {
        if (baseResponse.error != null) {
          failure = UnauthorizedFailure(message: baseResponse.error ?? "");
        } else {
          failure = UnauthorizedFailure();
        }
      } else if (statusCode == HttpStatus.internalServerError) {
        if (baseResponse.error != null) {
          failure = CustomFailure(message: baseResponse.error ?? "");
        } else {
          failure = const ServerFailure();
        }
      } else {
        String errorMessage = 'Unknown Error!';
        try {
          if (baseResponse.error != null) {
            errorMessage = baseResponse.error ?? "";
          }
        } finally {
          failure = CustomFailure(message: errorMessage);
        }
      }
      errorStreamController.add(failure);
      throw failure;
    } on HttpFailure {
      rethrow;
    } catch (e) {
      log("Error is::$e");
      throw const CustomFailure(message: "Unknown server Error!");
    }
  }

  // static int getStatusCode(http.Response response) {
  //   int httpStatus = response.statusCode;
  //   if (httpStatus == 200) {
  //     int innerResponseCode =
  //         BaseResponse.fromJson(jsonDecode(response.body), null).statusCode;
  //     return innerResponseCode;
  //   } else {
  //     return httpStatus;
  //   }
  // }

  static const Map<String, String> basicHeader = {
    'Content-Type': 'application/json'
  };

  static Map<String, String> basicHeaderWithToken(String token) => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
}

class Page<T> {
  final List<T> list;

  factory Page.fromJson(
    List<dynamic> json,
    T Function(Map<String, dynamic> json) listDecode,
  ) {
    return Page(
      list: (json).map<T>((e) => listDecode.call(e)).toList(),
    );
  }

  @override
  String toString() {
    return 'data: ${list.map((e) => '${e.toString()}\n')}';
  }

  Page({
    required this.list,
  });
}
