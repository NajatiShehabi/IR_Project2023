import 'dart:developer';

class BaseResponse<T> {
  final T? data;
  final String? error;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json)? dataDecode,
  ) {
    log(json['data'].toString());
    return BaseResponse(
      data: (json['data'] != null && json['data'] != "")
          ? dataDecode?.call(json['data'])
          : null,
      error: json['error']??"",
    );
  }

  @override
  String toString() {
    return 'data: $data';
  }

  BaseResponse({
    this.data,
    required this.error,
  });
}
/*

enum listKeys {
  rides,
}

class Page<T> {
  final List<T> list;
  final int count;

  factory Page.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) listDecode,
    listKeys key,
  ) {
    return Page(
      list: json[key.name] != null
          ? (json[key.name] as List)
              .map<T>((e) => listDecode.call(json[key.name]))
              .toList()
          : [],
      count: json['count'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'data: ${list.map((e) => '${e.toString()}\n')}';
  }

  Page({
    required this.list,
    required this.count,
  });
}
*/
