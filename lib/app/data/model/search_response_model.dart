class SearchResponseModel {
  SearchResponseModel();

  static Map<String, String> fromJson(Map<String, dynamic> json) {
    final errorMessages = <String, String>{};
    json.forEach((key, value) {
      errorMessages.putIfAbsent(key, () => value.toString());
    });
    return errorMessages;
  }
}
